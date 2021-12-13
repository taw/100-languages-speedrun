<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="xml" indent="yes"/>

  <xsl:template match="/persons">
    <messages>
      <xsl:apply-templates select="person"/>
    </messages>
  </xsl:template>

  <xsl:template match="person">
    <message>Hello, <xsl:value-of select="name" />!</message>
  </xsl:template>
</xsl:stylesheet>
