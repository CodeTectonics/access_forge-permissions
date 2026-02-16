# AccessForge::Permissions

`AccessForge::Permissions` provides a production-ready `PermissionPolicyRule` for **Ruby on Rails** applications using AccessForge.

It introduces a simple, composable way to express permission-based authorization - without imposing a fixed persistence model.

If you are using AccessForge and want permission checks backed by your own data model, this is the first extension you should reach for.

## Philosophy

AccessForge defines how policies are evaluated.

AccessForge::Permissions defines a reusable rule for permission checks.

This gem deliberately keeps its contract minimal:

If your `User` has a `has_many :permissions` association, `PermissionPolicyRule` will work.

That’s it.

How permissions are assigned - directly, via groups, or through any other structure - is entirely up to you.

## Installation

Add to your Gemfile:
```ruby
gem "access_forge-permissions"
```

Then:
```bash
bundle install
```

## The Core Rule: `PermissionPolicyRule`

`PermissionPolicyRule` checks whether the current user has a required permission.

It expects:
* A `User` model
* A `has_many :permissions` association on that model

Example:
```
class User < ApplicationRecord
  has_many :permissions
end
```

Or via has_many :through:
```
class User < ApplicationRecord
  has_many :access_group_users
  has_many :access_groups, through: :access_group_users
  has_many :permissions, through: :access_groups
end
```

## Usage with AccessForge

Inside your AccessForge policy:
```
class EmployeePolicy < AccessForge::Policy
  def index?
    authorized?(
      [ PermissionPolicyRule ],
      { feature: 'Employees', verb: :read }
    )
  end
end
```

When evaluated, the rule checks:
```
current_user.permissions.exists?({ permissions: { name: "Can #{options[:verb]} #{options[:feature]}" } })
```

If the permission exists, the rule passes.

If not, authorization fails.

Because it is a rule object, it composes naturally with other AccessForge rules.

## Flexible Data Models

This gem does **not** enforce a particular authorization architecture.

You may:
* Assign permissions directly to users
* Implement group-based RBAC
* Build hierarchical group structures
* Introduce multi-tenant permission scoping
* Extend the Permission model with metadata

The only requirement is that the user responds to:
```
user.permissions
```

This design keeps your authorization model:
* Explicit
* Evolvable
* Aligned with your domain

## Access Group Generator

To help you get started, this gem includes a generator that creates a conventional group-based permission structure.

Run:
```bash
rails generate access_forge:access_groups
```

This creates:
* AccessGroup
* AccessGroupUser
* AccessGroupPermission
* Permission

Along with their corresponding migrations.

The generated structure provides:
* Many-to-many Users ↔ AccessGroups
* Many-to-many AccessGroups ↔ Permissions
* A `has_many :permissions, through:` setup on `User`

You are free to modify or extend these models after generation.

The generator exists for convenience - not constraint.

## Why This Design?

Many authorization libraries tightly couple:
* Policy logic
* Persistence model
* DSL assumptions

`AccessForge::Permissions` intentionally separates these concerns.
* AccessForge evaluates policies.
* PermissionPolicyRule checks permissions.
* Your application owns the data model.

This separation provides:
* Architectural control
* Testable rule objects
* Clear domain boundaries
* Long-term flexibility

## When to Use This Extension

Use `AccessForge::Permissions` if:
* You want permission-based authorization
* You prefer explicit policy objects over implicit callbacks
* You want full control over your persistence model
* You are building a system where authorization must evolve over time

## Relationship to AccessForge

AccessForge is a controller-oriented policy engine built for experienced Rails developers who value architectural control.

`AccessForge::Permissions` is the first official extension — providing a clean, composable permission rule that integrates seamlessly into the core engine.

Together they provide:
* Explicit controller authorization
* Composable rule objects
* Flexible persistence strategies
* Clear separation of concerns

## Development

After checking out the repository:
```
bin/setup
rake spec
```

To release a new version:
1. Update the version number in `version.rb`
2. Run:
```
bundle exec rake release
```

This will tag the release, push commits, and publish the gem to RubyGems.

## Contributing

Bug reports and pull requests are welcome on GitHub:

[https://github.com/CodeTectonics/access_forge-permissions](https://github.com/CodeTectonics/access_forge-permissions).

This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [code of conduct](https://github.com/CodeTectonics/access_forge-permissions/blob/main/CODE_OF_CONDUCT.md).

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the AccessForge project's codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/CodeTectonics/access_forge-permissions/blob/main/CODE_OF_CONDUCT.md).

