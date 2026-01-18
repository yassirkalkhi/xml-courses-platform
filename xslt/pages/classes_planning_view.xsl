<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title"><xsl:value-of select="/root/labels/label[@key='planning']"/></xsl:with-param>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                <div class="content-card">
                  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                    <div>
                        <h1 style="margin: 0;"><xsl:value-of select="/root/labels/label[@key='planning']"/></h1>
                        <p style="color: #666; margin: 0.5rem 0 0 0;">
                            <xsl:value-of select="/root/content/class/name"/>   
                        </p>
                    </div>
                    <div>
                        <a href="/classes" class="btn btn-secondary"><xsl:value-of select="/root/labels/label[@key='back_to_list']"/></a>
                    </div>
                  </div>

                  <div style="margin-bottom: 2rem;">
                    <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
                        <h3 style="margin: 0;"><xsl:value-of select="/root/labels/label[@key='planning']"/></h3>
                        <xsl:if test="/root/session/role = 'admin'">
                            <a href="/classes/planning/{/root/content/class/id}" class="btn btn-sm" style="background-color: #c1c1c1ffff;"><xsl:value-of select="/root/labels/label[@key='edit_planning']"/></a>
                        </xsl:if>
                    </div>
                    <table style="width:100%; border-collapse: collapse;">
                        <thead>
                            <tr style="border-bottom: 2px solid #eee; text-align: left;">
                                <th style="padding: 0.75rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='type']"/></th>
                                <th style="padding: 0.75rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='date']"/></th>
                                <th style="padding: 0.75rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='time']"/></th>
                                <th style="padding: 0.75rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='room']"/></th>
                            </tr>
                        </thead>
                        <tbody>
                            <xsl:if test="count(/root/content/planning/event) = 0">
                                <tr>
                                    <td colspan="4" style="padding: 1rem; text-align: center; color: #999;">No events planned.</td>
                                </tr>
                            </xsl:if>
                            <xsl:for-each select="/root/content/planning/event">
                                <tr style="border-bottom: 1px solid #eee;">
                                    <td style="padding: 0.75rem;">
                                        <span class="badge badge-{type}">
                                            <xsl:choose>
                                                <xsl:when test="type = 'TP'"><xsl:value-of select="/root/labels/label[@key='tp']"/></xsl:when>
                                                <xsl:otherwise><xsl:value-of select="/root/labels/label[@key='exam']"/></xsl:otherwise>
                                            </xsl:choose>
                                        </span>
                                    </td>
                                    <td style="padding: 0.75rem;"><xsl:value-of select="date"/></td>
                                    <td style="padding: 0.75rem;"><xsl:value-of select="time"/></td>
                                    <td style="padding: 0.75rem;"><xsl:value-of select="room"/></td>
                                </tr>
                            </xsl:for-each>
                        </tbody>
                    </table>
                  </div>
                </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
