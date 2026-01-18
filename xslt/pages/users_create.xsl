<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title"><xsl:value-of select="/root/labels/label[@key='create_user']"/></xsl:with-param>
      </xsl:call-template>
      <body class="app-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <xsl:call-template name="sidebar"/>
            <main class="main-content">
                <div class="content-card" style="max-width: 500px;">
                  <h1><xsl:value-of select="/root/labels/label[@key='create_user']"/></h1>
                  
                  <form action="/users/create" method="POST">
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='name']"/></label>
                      <input type="text" name="name" required="required" placeholder="Full Name"/>
                    </div>
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='email']"/></label>
                      <input type="email" name="email" required="required" placeholder="email@example.com"/>
                    </div>
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='password']"/></label>
                      <input type="password" name="password" required="required" placeholder="••••••••"/>
                    </div>
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='role']"/></label>
                      <select name="role">
                        <option value="student">Student</option>
                        <option value="teacher">Teacher</option>
                        <option value="admin">Admin</option>
                      </select>
                    </div>
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='language']"/></label>
                      <select name="language">
                        <option value="fr">Français</option>
                        <option value="ar">العربية</option>
                      </select>
                    </div>
                    
                    <div style="display: flex; gap: 1rem; margin-top: 1.5rem;">
                      <a href="/users" class="btn btn-secondary"><xsl:value-of select="/root/labels/label[@key='cancel']"/></a>
                      <button type="submit" class="btn"><xsl:value-of select="/root/labels/label[@key='create_user']"/></button>
                    </div>
                  </form>
                </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
