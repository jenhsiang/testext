/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.54
 * Generated at: 2014-11-19 10:09:48 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.__0040admin;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.awt.*;
import java.awt.image.*;
import java.util.*;
import javax.imageio.*;

public final class image_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


Color getRandColor(int fc,int bc){//çµ¦å®ç¯åç²å¾é¨æ©é¡è²
        Random random = new Random();
        if(fc>255) fc=255;
        if(bc>255) bc=255;
        int r=fc+random.nextInt(bc-fc);
        int g=fc+random.nextInt(bc-fc);
        int b=fc+random.nextInt(bc-fc);
        return new Color(r,g,b);
        }

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("image/jpeg");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write('\r');
      out.write('\n');
      out.write('\r');
      out.write('\n');

//è¨­å®é é¢ä¸ç·©å­
response.setHeader("Pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.setDateHeader("Expires", 0);

// å¨è¨æ¶é«ä¸­åµå»ºåå
int width=60, height=20;
BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

// ç²ååå½¢ä¸ä¸æ
Graphics g = image.getGraphics();

//çæé¨æ©é¡
Random random = new Random();

// è¨­å®èæ¯è²
g.setColor(getRandColor(200,250));
g.fillRect(0, 0, width, height);

//è¨­å®å­é«
g.setFont(new Font("Times New Roman",Font.PLAIN,18));

//ç«éæ¡
//g.setColor(new Color());
//g.drawRect(0,0,width-1,height-1);


// é¨æ©ç¢ç155æ¢å¹²æ¾ç·ï¼ä½¿ååä¸­çèªè­ç¢¼ä¸æè¢«å¶ä»ç¨å¼æ¢æ¸¬å°
g.setColor(getRandColor(160,200));
for (int i=0;i<155;i++)
{
 int x = random.nextInt(width);
 int y = random.nextInt(height);
        int xl = random.nextInt(12);
        int yl = random.nextInt(12);
 g.drawLine(x,y,x+xl,y+yl);
}

// åé¨æ©ç¢ççèªè­ç¢¼(4ä½åæ¸ä½)
String sRand="";
for (int i=0;i<4;i++){
    String rand=String.valueOf(random.nextInt(10));
    sRand+=rand;
    // å°èªè­ç¢¼é¡¯ç¤ºå°ååä¸­
    g.setColor(new Color(20+random.nextInt(110),20+random.nextInt(110),20+random.nextInt(110)));//èª¿ç¨å½æ¸åºä¾çé¡è²ç¸åï¼å¯è½æ¯å çºç¨®å­å¤ªæ¥è¿ï¼æä»¥åªè½ç´æ¥çæ
    g.drawString(rand,13*i+6,16);
}

// å°èªè­ç¢¼å­å¥SESSION
session.setAttribute("rand",sRand);


// ååçæ
g.dispose();

// è¼¸åºååå°é é¢
ImageIO.write(image, "JPEG", response.getOutputStream());
response.getOutputStream().flush();
response.getOutputStream().close();
response.flushBuffer();

out.clear();
out = pageContext.pushBody();

    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
