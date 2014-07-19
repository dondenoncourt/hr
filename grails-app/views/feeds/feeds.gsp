<?xml version="1.0" encoding="UTF-8"?>
<feeds version="1.0">
    <channel>
    <title>Internal Postings</title>
    <link><g:link controller="candidate" action="create" /></link>
    <description>Daffron internal job postings</description>
    <pubDate>Fri, 02 Mar 2012 12:15:48 CST</pubDate>
         <g:each in="${iPostReqList}" var="req">
            <item>
                <title>${req.jobD}</title>
                <link>http://localhost:8080/hr/candidate/create/${req.id}</link>
                <description>${req.jobD.job}</description>
            </item>
        </g:each>
    </channel>
    <channel>
    <title>Company News</title>
    <link>http://intranet.daffron.com</link>
    <description>Latest company news</description>
    <pubDate>Fri, 02 Mar 2012 12:15:48 CST</pubDate>
         <g:each in="${compNewsList}" var="news">
            <item>
                <title>${news.jobD}</title>
                <link>http://localhost:8080/hr/candidate/create/${news.id}</link>
                <description>${news.jobD.job}</description>
            </item>
        </g:each>
        <item>
            <title>Test</title>
            <link>http://www.daffron.com</link>
            <description>blah blah blah, la di dah di di</description>
        </item>
    </channel>
    <channel>
    <title>Announcements</title>
    <link>http://intranet.daffron.com</link>
    <description>Latest company announcements</description>
    <pubDate>Fri, 02 Mar 2012 12:15:48 CST</pubDate>
         <g:each in="${announcementsList}" var="item">
            <item>
                <title>${item.jobD}</title>
                <link>http://localhost:8080/hr/candidate/create/${item.id}</link>
                <description>${item.jobD.job}</description>
            </item>
        </g:each>
    </channel>
</feeds>
  