<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>

  <xsl:template match="/persons"><xsl:apply-templates select="person"/></xsl:template>

  <xsl:template match="person">
    <xsl:text>Hello, </xsl:text>
    <xsl:value-of select="name" />
    <xsl:text> </xsl:text>
    <xsl:value-of select="surname" />
    <xsl:text>!&#10;</xsl:text>
  </xsl:template>
</xsl:stylesheet>
