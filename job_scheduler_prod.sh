#!/bin/bash

/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:common_crawl_worker &'

/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:packagist_crawl_worker &'
/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:packagist_crawl_worker &'
/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:packagist_crawl_worker &'
/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:packagist_crawl_worker &'
/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:packagist_crawl_worker &'
/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:packagist_crawl_worker &'
/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:packagist_crawl_worker &'

/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:satis_crawl_worker &'
/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:satis_crawl_worker &'

/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:npm_crawl_worker &'

/bin/bash -l -c 'cd /ruby_crawl; /usr/local/bin/bundle exec rake versioneye:scheduler_crawl_r_prod'