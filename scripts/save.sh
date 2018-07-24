#!/bin/bash
mysqldump -uwp -pwp wp wp_wpam_affiliates > wp_wpam_affiliates.sql
mysqldump -uwp -pwp wp wp_wpam_affiliates_fields > wp_wpam_affiliates_fields.sql
git commit -m "`date +'%Y-%M-%d_%H:%m'`"
git push -u origin master



