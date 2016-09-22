package com.hxht.personalproject;

import org.apache.http.impl.client.HttpClientBuilder;

import com.gargoylesoftware.htmlunit.WebClient;
import com.gargoylesoftware.htmlunit.html.HtmlButton;
import com.gargoylesoftware.htmlunit.html.HtmlInput;
import com.gargoylesoftware.htmlunit.html.HtmlPage;

public class ClickCheckBox {

	public static void main(String[] args) throws Exception{
		String url = "http://vote.e23.cn/zhuanti/jnzmgj/index.html";
		final WebClient client = new WebClient();
		client.getOptions().setCssEnabled(false);
		client.getOptions().setJavaScriptEnabled(false);
		final HtmlPage page = client.getPage(url);
		 // 提交  
        HtmlButton submit = (HtmlButton) page.getElementById("loginBtn");  
        HtmlPage nextPage = submit.click();  
        System.out.println(nextPage.asXml());
		client.closeAllWindows();
		
	}
    public static void tianya() throws Exception {  
  	  
        WebClient webClient = new WebClient();  
        // 拿到这个网页  
        HtmlPage page = webClient.getPage("http://passport.tianya.cn/login.jsp");  
  
        // 填入用户名和密码  
        HtmlInput username = (HtmlInput) page.getElementById("userName");  
        username.type("ifugletest2014");  
        HtmlInput password = (HtmlInput) page.getElementById("password");  
        password.type("test123456");  
  
        // 提交  
        HtmlButton submit = (HtmlButton) page.getElementById("loginBtn");  
        HtmlPage nextPage = submit.click();  
        System.out.println(nextPage.asXml());  
  
    }  

}
