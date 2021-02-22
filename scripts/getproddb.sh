#!/bin/bash
	
#get siteurl option from prod and dev
PROD_SITEURL=$(wp @prod option get siteurl);
DEV_SITEURL=$(wp option get siteurl);
	
#Export database from prod and import to dev
wp @prod db export - > prod.sql
wp db import prod.sql
	
#Update siteurl
wp search-replace $PROD_SITEURL $DEV_SITEURL
	
#Remove .sql file
rm prod.sql