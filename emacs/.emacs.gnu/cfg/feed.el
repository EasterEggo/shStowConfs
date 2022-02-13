(use-package elfeed
             :custom
             (elfeed-feeds
              '("https://distrowatch.com/news/dwd.xml" linux
                "https://www.economist.com/finance-and-economics/rss.xml" economics))
             (elfeed-search-filter "@1-week-ago +unread"))

(provide 'feed)
