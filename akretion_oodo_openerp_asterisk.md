# odoo 9.0
```
cd /tmp
git clone /media/data-office/git-repos/connector-telephony.git
cd connector-telephony
git checkout 9.0 (or 9.0ee for enterprise edition)       
cp -r asterisk_click2dial/ /opt/odoo/addons/
cp -r base_phone/ /opt/odoo/addons/
/etc/init.d/odoo-server stop
/etc/init.d/odoo-server start
```
- login into odoo with admin rights
- activate developer mode (profile -> about)
- CE: go to Apps > Update Apps List, so Odoo will check for new modules in the addons directories.
- EE: install Apps
- Settings, tech, telephony: configure asterisk connection
- Settings, Company, your company, change country to your country

- users, telephony: configure user settings. (Important to set callerid...this callerid will be used)

click2dial should work as well as reverse lookup (by clicking the telephone in top bar) on incoming call or in connected call

# popups
## odoo configuration
```
cp -r base_phone_popup/ /opt/odoo/addons/
apt-get install hg
cd /tmp
hg clone https://bitbucket.org/anybox/bus_enhanced -r 9.0
hg clone https://bitbucket.org/anybox/web_action_request -r 9.0
cp -r web_action_request/web_action_request /opt/odoo/addons/
cp -r bus_enhanced/bus_enhanced /opt/odoo/addons/
```
- login into odoo with admin rights
- activate developer mode (profile -> about)
- CE: go to Apps > Update Apps List, so Odoo will check for new modules in the addons directories.
- EE: install base_phone_popup

## asterisk configuration
install python
copy agi/openerp_popup_timeout.sh and set_name_agi.py into agi directory

call agi script fromwithin your dialplan
``
exten => s,1,AGI(odoo/openerp_popup_timeout.sh,<odoo-server>,<odoo-db>,<odoo-admin-user-id>,<odoo-admin-pass>,<username to notify>
``
odoo admin user id is usually 1
