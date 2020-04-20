## SETUP GUIDE FOR COMMAND LINE PROJECTS.

- Once in the project folder :

    - in the terminal,
    1. bundle init, which will generate a Gemfile.
    2. In the Gemfile specify the Ruby version you want to work with and the gems of your choice, in this case rspec, rubocop and simplecov. 

    ```ruby
     
    source "https://rubygems.org"

    ruby 2.6.3

    gem 'rspec'
    gem 'rubocop'
    gem 'simplecov'

    ```
    3. In the terminal again run
    ```
     $ bundle install
    ``` 
    This will install the gems in you project and you will see it in the file GemLock.

    4. To finish the setup create a directory /lib in the root of the project.

    ```
    $ mkdir lib
    $ rspec --init
    ```
    5. Place your spec files within the spec folder and the implementation files in the lib folder. Require the random_name.rb file you want to test in the random_name_spec.rb file. 

    ```ruby
    require 'random_name'
    ```

    6. To run the tests simply run
    ``` 
    $ rspec 
    ```
    on the root folder, rspec gem knows where to find the files.

    7. Create the version control with:
    ```c
    $ git init
    $ git add .
    $ git commit -m 'first commit'
    $ git push //push it if a github repo is created or create one.
    $ git checkout -b sandbox // to create a branch and work safely, make a first commit
    //in the branch and push it , git push origin sandbox
    ```
    It is strongly recommended to work in the branch, commit frequently and merge the result to master each time the implementation is correct. Once is merged, go back to the branch again and repeat the process.

    8. Have fun!.

    # Configuration Rubocop and simplecov.

    In this setup Rubocop and simplecov are configured, to change anything of that configuration
    please visit for complete guidande.

    [rubocop-docs](https://docs.rubocop.org/en/stable/basic_usage/) ||
    [simplecov-gem-docs](https://github.com/colszowka/simplecov)

