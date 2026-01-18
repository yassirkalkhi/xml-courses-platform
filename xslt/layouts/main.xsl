<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
   
  <xsl:template name="html-head">
    <xsl:param name="title"/>
    <head>
      <meta charset="UTF-8"/>
      <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
      <title><xsl:value-of select="$title"/> - EduPlatform</title>
      <link rel="stylesheet" href="/css/style.css"/>
      <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;family=Noto+Sans+Arabic:wght@400;500;700&amp;display=swap"/>
      <script>
        function changeLang(lang) {
          document.cookie = "lang=" + lang + "; path=/; max-age=31536000";
          window.location.reload();
        }
      </script>
    </head>
  </xsl:template>

  <xsl:template name="top-header">
    <header class="top-header">
      <div class="header-left">
        <a href="/dashboard" class="logo">EduPlatform</a>
      </div>
      <div class="header-right">
        <select class="lang-select" onchange="changeLang(this.value)">
          <option value="en">
            <xsl:if test="/root/lang = 'en'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
            English
          </option>
          <option value="fr">
            <xsl:if test="/root/lang = 'fr'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
            Français
          </option>
          <option value="ar">
            <xsl:if test="/root/lang = 'ar'"><xsl:attribute name="selected">selected</xsl:attribute></xsl:if>
            العربية
          </option>
        </select>
        <xsl:choose>
          <xsl:when test="/root/isLoggedIn = 'true'">
            <a href="/logout" class="btn btn-sm btn-secondary">
              <xsl:value-of select="/root/labels/label[@key='logout']"/>
            </a>
          </xsl:when>
          <xsl:otherwise>
            <a href="/login" class="btn btn-sm">
              <xsl:value-of select="/root/labels/label[@key='login']"/>
            </a>
          </xsl:otherwise>
        </xsl:choose>
      </div>
    </header>
  </xsl:template>

  <xsl:template name="sidebar">
    <xsl:if test="/root/isLoggedIn = 'true'">
      <aside class="sidebar">
        <nav class="sidebar-nav">
          <a href="/dashboard" class="nav-item">
            <xsl:value-of select="/root/labels/label[@key='dashboard']"/>
          </a>
          <xsl:if test="/root/userRole = 'admin'">
            <a href="/users" class="nav-item">
              <xsl:value-of select="/root/labels/label[@key='users']"/>
            </a>
            <a href="/classes" class="nav-item">
              <xsl:value-of select="/root/labels/label[@key='classes']"/>
            </a>
          </xsl:if>

          <xsl:if test="count(/root/sidebarClasses/class) > 0">
            <div style="padding: 1rem 1rem 0.5rem 1rem; font-size: 0.75rem; color: var(--text-muted); text-transform: uppercase; letter-spacing: 0.05em; font-weight: 600;">
                <xsl:value-of select="/root/labels/label[@key='my_classes']"/>
            </div>
            <xsl:for-each select="/root/sidebarClasses/class">
              <a href="/classes/view/{id}" class="nav-item" style="padding-left: 1.5rem; font-size: 0.875rem;">
                <xsl:value-of select="name"/>
              </a>
            </xsl:for-each>
          </xsl:if>
        </nav>
      </aside>
    </xsl:if>
  </xsl:template>

  <xsl:template name="main-layout">
    <xsl:param name="title"/>
    <xsl:param name="content"/>
    <html lang="{/root/lang}" dir="{/root/dir}">
        <xsl:call-template name="html-head">
            <xsl:with-param name="title" select="$title"/>
        </xsl:call-template>
        <body>
            <xsl:attribute name="class">
                <xsl:choose>
                    <xsl:when test="/root/isLoggedIn = 'true'">app-layout</xsl:when>
                    <xsl:otherwise>auth-layout</xsl:otherwise>
                </xsl:choose>
            </xsl:attribute>
            <xsl:call-template name="top-header"/>
            <div class="app-body" style="min-height: 100vh; display: flex; flex-direction: row;">
                <xsl:call-template name="sidebar"/>
                <main class="main-content" style="flex: 1;">
                    <xsl:copy-of select="$content"/>
                </main>
            </div>
        </body>
    </html>
  </xsl:template>

</xsl:stylesheet>
