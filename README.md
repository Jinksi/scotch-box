

# <img src="http://thriveweb.com.au/email7/thrive.gif" alt="Thrive Box" width="100px"/> Thrive Box

### Installation

1. Clone this repo into your desired site directory. `git clone https://github.com/Jinksi/thrive-box.git my-site`

1. In _Vagrantfile_, change the hostname – `config.vm.hostname = "thrive-box.dev"` to `"my-site.dev"`

1. Open your site directory in terminal and run `vagrant up`. It will take ~10mins the first time you create a site, ~30sec thereafter.


### Importing an existing Wordpress site

1. Copy the site into `public`

1. Copy the site's database (`mysite_db.sql`) to `public`

1. Update `wp-config.php` to use the database user & password: `root`

1. SSH into the Virtual Host with `vagrant ssh` from the site directory

1. Change to the `public` directory
  > `cd /var/www/public`

1. Create a new database
  > `wp db create`

1. Import your existing database
  > `wp db import mysite_db.sql`

1. Search and replace
  > `wp search-replace live-site.thrv.xyz my-site.dev`


### Creating a new Wordpress site

1. Update site settings in `config.yml`

  > Choose sitename, plugins, theme, username, password etc.

1. SSH into the Virtual Host with `vagrant ssh` from the site directory

1. Change to the `www` directory
  > `cd /var/www`

1. Run the setup script
  > `bash setup.sh`

1. Done
