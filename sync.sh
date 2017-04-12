#!/bin/bash
rsync -Pav --delete asterisk_click2dial/ $1/addons/addons/asterisk_click2dial/
rsync -Pav --delete base_phone/ $1/addons/addons/base_phone/
rsync -Pav --delete base_phone_popup/ $1/addons/addons/base_phone_popup/
