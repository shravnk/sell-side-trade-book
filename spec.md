# Specifications for the Rails Assessment

Specs:
- [x] Using Ruby on Rails for the project
- [x] Include at least one has_many relationship (Trader has_many Transacts) 
- [x] Include at least one belongs_to relationship (Transact belongs_to Bond)
- [x] Include at least one has_many through relationship (Trader has_many Clients through Transacts)
- [x] The "through" part of the has_many through includes at least one user submittable attribute (Transact.price)
- [x] Include reasonable validations for simple model objects (Transact, User, Trader,)
- [x] Include a class level ActiveRecord scope method (Transact.top_salespeople, '/clients/:id/show')
- [x] Include signup (has_secure_password)
- [x] Include login (has_secure_password)
- [x] Include logout (has_secure_password)
- [x] Include third party signup/login (OmniAuth, Github)
- [x] Include nested resource show or index (salespeople/:id/transacts)
- [x] Include nested resource "new" form (bonds/:id/transacts/new)
- [x] Include form display of validation errors (/transacts/new)

Confirm:
- [x] The application is pretty DRY
- [x] Limited logic in controllers
- [x] Views use helper methods if appropriate
- [x] Views use partials if appropriate