<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
  <xsl:import href="../layouts/main.xsl"/>

  <xsl:template match="/">
    <html lang="{/root/lang}" dir="{/root/dir}">
      <xsl:call-template name="html-head">
        <xsl:with-param name="title" select="/root/labels/label[@key='login']"/>
      </xsl:call-template>
      <body class="auth-layout">
        <xsl:call-template name="top-header"/>
        <div class="app-body">
            <main class="main-content">
                <div class="content-card" style="max-width: 400px; margin: 2rem auto;">
                  <h1 style="text-align: center; margin-bottom: 1.5rem;">
                    <xsl:value-of select="/root/labels/label[@key='login']"/>
                  </h1>
                  
                  <xsl:if test="/root/content/error">
                    <div class="error-message" style="text-align: center;">
                      <xsl:value-of select="/root/content/error"/>
                    </div>
                  </xsl:if>

                  <form action="/login" method="POST">
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='email']"/></label>
                      <input type="email" name="email" required="required" placeholder="you@example.com"/>
                    </div>
                    <div class="form-group">
                      <label><xsl:value-of select="/root/labels/label[@key='password']"/></label>
                      <input type="password" name="password" required="required" placeholder="••••••••"/>
                    </div>
                    <button type="submit" class="btn" style="width: 100%; margin-top: 0.5rem;">
                      <xsl:value-of select="/root/labels/label[@key='submit']"/>
                    </button>
                  </form>
                </div>
            </main>
        </div>
      </body>
    </html>
  </xsl:template>
</xsl:stylesheet>
