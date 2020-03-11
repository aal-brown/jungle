# Jungle

A mini e-commerce application built with Rails 4.2.


## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe

## Final Product

!["Screenshot of main products page"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/products-page.png)
!["Screenshot of product details page"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/product-details-page.png)
!["Screenshot of about page"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/about-page.png)
!["Screenshot of cart"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/cart.png)
!["Screenshot of payment window"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/payment-window-from-cart.png)
!["Screenshot of order summary"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/successful-order-summary.png)
!["Screenshot of admin dashboard"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/admin-dashboard.png)
!["Screenshot of admin categories page"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/admin-categories.png)
!["Screenshot of admin products page"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/admin-products.png)
!["Screenshot of admin sales page"](https://github.com/aal-brown/jungle/blob/master/app/assets/images/admin-sales.png)