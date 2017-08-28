package net04.crawling;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;

public class PB {
	public static void main(String[] args) {
		
	try {
		Document doc =  Jsoup.connect("http://www.wemakeprice.com/?utm_source=google&utm_medium=cpc&utm_term=%2E%EC%9C%84%EB%A9%94%ED%94%84&utm_content=wemake&utm_campaign=r_sa&gclid=Cj0KCQjw_o7NBRDgARIsAKvAgt0XToSAkzonC3HrDCZiNipsYwyB3uK9e-y9rti2wIixsINM3KqpPKUaAnMzEALw_wcB").get();
		Elements elements = doc.select(
				"span.box_desc "
		);
		for(Element e : elements) {
			String img = e.select(".box_thumb").html();
			
			String prod = e.select(".tit_desc").html();
			String prodname="";
			if(prod.indexOf("<")!=-1) {
			prodname = prod.substring(0, prod.indexOf("<"));
			}else {prodname=prod;}
			
			String sale = e.select(".sale").html();
			int j = sale.indexOf("<");
			String price = sale.substring(0, j);
			
			System.out.println(img+"상품명 : "+prodname+"\t가격 : "+price);
		}
	} catch(Exception e) {
		e.printStackTrace();
	}
}
}

