<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title"><xsl:value-of select="/root/labels/label[@key='participants']"/> - <xsl:value-of select="/root/content/class/name"/></xsl:with-param>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                <div class="content-card">
                  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 2rem;">
                    <div>
                        <h1 style="margin: 0;"><xsl:value-of select="/root/labels/label[@key='participants']"/></h1>
                        <p style="color: #666; margin: 0.5rem 0 0 0;">
                            <xsl:value-of select="/root/content/class/name"/>
                        </p>
                    </div>
                     <a href="/classes" class="btn btn-secondary"><xsl:value-of select="/root/labels/label[@key='back_to_classes']"/></a>
                  </div>

                  <table style="width:100%; border-collapse: collapse; margin-top: 1rem;">
                    <thead>
                      <tr style="border-bottom: 2px solid #eee; text-align: left;">
                        <th style="padding: 1rem;"><xsl:value-of select="/root/labels/label[@key='name']"/></th>
                        <th style="padding: 1rem;"><xsl:value-of select="/root/labels/label[@key='email']"/></th>
                        <th style="padding: 1rem;"><xsl:value-of select="/root/labels/label[@key='role']"/></th>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:if test="count(/root/content/participants/user) = 0">
                            <tr>
                                <td colspan="3" style="padding: 1rem; text-align: center; color: #999;">No participants found.</td>
                            </tr>
                       </xsl:if>
                      <xsl:for-each select="/root/content/participants/user">
                        <tr style="border-bottom: 1px solid #eee;">
                            <td style="padding: 1rem;"><xsl:value-of select="name"/></td>
                            <td style="padding: 1rem;"><xsl:value-of select="email"/></td>
                            <td style="padding: 1rem;">
                                <span class="badge badge-{role}">
                                    <xsl:value-of select="role"/>
                                </span>
                            </td>
                        </tr>
                      </xsl:for-each>
                    </tbody>
                  </table>
                </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
