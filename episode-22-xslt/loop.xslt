<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:output method="text"/>

  <xsl:template name="iteration">
    <xsl:param name="i" />
    <xsl:param name="max" />

    <xsl:text>Iteration </xsl:text>
    <xsl:value-of select="$i"/>
    <xsl:text>&#10;</xsl:text>
    <xsl:if test="$max > $i">
      <xsl:call-template name="iteration">
        <xsl:with-param name="i" select="$i + 1"/>
        <xsl:with-param name="max" select="$max"/>
      </xsl:call-template>
    </xsl:if>
  </xsl:template>

  <xsl:template match="/loop">
    <xsl:call-template name="iteration">
      <xsl:with-param name="i" select="1"/>
      <xsl:with-param name="max" select="."/>
    </xsl:call-template>
  </xsl:template>
</xsl:stylesheet>
