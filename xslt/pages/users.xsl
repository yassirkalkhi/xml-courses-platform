<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title"><xsl:value-of select="/root/labels/label[@key='users']"/></xsl:with-param>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                <div class="content-card">
                  <div style="display: flex; justify-content: space-between; align-items: center; margin-bottom: 1rem;">
                    <h1 style="margin: 0;"><xsl:value-of select="/root/labels/label[@key='users']"/></h1>
                    
                    <xsl:if test="/root/session/role = 'admin'">
                        <a href="/users/create" class="btn">+ <xsl:value-of select="/root/labels/label[@key='create_user']"/></a>
                    </xsl:if>
                  </div>
                  
                  <table style="width:100%; border-collapse: collapse; margin-top: 1rem;">
                    <thead>
                      <tr style="border-bottom: 2px solid #eee; text-align: left;">
                        <th style="padding: 1rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='name']"/></th>
                        <th style="padding: 1rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='email']"/></th>
                        <th style="padding: 1rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='role']"/></th>
                        <xsl:if test="/root/session/role = 'admin'">
                            <th style="padding: 1rem; font-weight: normal;"><xsl:value-of select="/root/labels/label[@key='action']"/></th>
                        </xsl:if>
                      </tr>
                    </thead>
                    <tbody>
                      <xsl:for-each select="/root/content/users/user">
                        <tr style="border-bottom: 1px solid #eee;">
                            <td style="padding: 1rem;"><xsl:value-of select="name"/></td>
                            <td style="padding: 1rem;"><xsl:value-of select="email"/></td>
                            <td style="padding: 1rem;">
                                <span class="badge badge-{role}">
                                    <xsl:value-of select="role"/>
                                </span>
                            </td>
                            <xsl:if test="/root/session/role = 'admin'">
                                <td style="padding: 1rem; text-align: right;" class="table-actions">
                                  <a href="/users/edit/{id}" class="action-btn" style="background-color: #c1c1c1ffff;"><xsl:value-of select="/root/labels/label[@key='edit']"/></a>
                                  <a href="/users/delete/{id}" class="action-btn" style="background-color: #ef4444ff;" onclick="return confirm('{/root/labels/label[@key='are_you_sure']}')"><xsl:value-of select="/root/labels/label[@key='delete']"/></a>
                                </td>
                            </xsl:if>
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
