<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title"><xsl:value-of select="/root/labels/label[@key='edit_user']"/></xsl:with-param>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                <div class="content-card" style="max-width: 500px;">
                  <h1><xsl:value-of select="/root/labels/label[@key='edit_user']"/></h1>
                  
                  <form action="/users/edit/{/root/content/user/id}" method="POST">
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='name']"/></label>
                      <input type="text" name="name" value="{/root/content/user/name}" required="required"/>
                    </div>
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='email']"/></label>
                      <input type="email" value="{/root/content/user/email}" disabled="disabled"/>
                      <small style="color: grey;">Email cannot be changed.</small>
                    </div>
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='role']"/></label>
                      <select name="role">
                        <option value="student">
                          <xsl:if test="/root/content/user/role = 'student'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
                          Student
                        </option>
                        <option value="teacher">
                          <xsl:if test="/root/content/user/role = 'teacher'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
                          Teacher
                        </option>
                        <option value="admin">
                          <xsl:if test="/root/content/user/role = 'admin'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
                          Admin
                        </option>
                      </select>
                    </div>
                    
                    <div style="display: flex; gap: 1rem; margin-top: 1.5rem;">
                      <a href="/users" class="btn btn-secondary"><xsl:value-of select="/root/labels/label[@key='cancel']"/></a>
                      <button type="submit" class="btn"><xsl:value-of select="/root/labels/label[@key='save_changes']"/></button>
                    </div>
                  </form>
                </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
