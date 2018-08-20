package com.firedogs.grandpringles.util;

import java.io.*;

import org.apache.ibatis.io.*;
import org.apache.ibatis.session.*;

public class SqlSessionUtil {

	private static SqlSessionFactory factory;
	
	
	/*
	 * �씤�뒪�꽩�뒪 留대쾭�븘�뱶�쓽 珥덇린�솕 : �깮�꽦�옄 static 留대쾭�븘�뱶�쓽 珥덇린�솕 : static �쁺�뿭�뿉�꽌
	 */
	static {
		/* �꽑�뼵 諛� 珥덇린�솕�뒗 諛뽰뿉�꽌 (try~ catch援щЦ�뿉 �쟻�쑝硫� 嫄곌린�꽌留� �씤吏��븯湲� �븣臾�) */
		Reader reader = null;
		
		try {
			/*package媛� 湲몄뼱吏�硫� �빐�떦 肄붾뵫�룄 湲몄뼱以섏빞�븳�떎.*/
			reader = Resources.getResourceAsReader("com/firedogs/grandpringles/config/mybatis-config.xml");			
			SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();			
			factory = builder.build(reader);

		
		} catch(Exception e) {
			e.printStackTrace();
		}	
	}

	public static SqlSession getSession() {

		return factory.openSession(true);
	}
}
