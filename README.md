Testing framework structure:
    bin folder contains different drivers for Selenium (e.g. Chromedriver)
    lib folder:
        common: webdriver configurations
        helpers: utilities for tests
        test_helpers : specific helpers for tests
        models: test configuration data readers
        page_objects : all the page objects
    spec folder:
        acceptance_tests : selenium based tests
    test_data:
        files for tests (e.g. .yml, .jpg)

Prerequisites:
    Ruby version 2.2.1 installed

Setup:
    Open the terminal
    Download repository on local machine
    Go to the project's root directory
    Run: bundle install

Run the tests on local machine:

    Running: rspec from command line will start running both tests on your local machine using Firefox browser

    Run script for Ghost test:
        rspec spec/acceptance_tests/ghost_spec.rb
    Run script for Adoption test:
        rspec spec/acceptance_tests/adoption_spec.rb

