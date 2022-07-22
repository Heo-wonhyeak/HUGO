package com.example.hugo;

import java.sql.Connection;

import javax.inject.Inject;
import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.example.hugo.service.HotSpotService;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations ={"file:src/main/webapp/WEB-INF/spring/**/root-context.xml"})
public class Test {

    @Inject
    private DataSource ds;
    
    @Inject
    private HotSpotService hotSpotService;
       
    @Inject
    private SqlSessionFactory sqlFactory;
 
    @org.junit.Test
    public void test() throws Exception{

        try(Connection conn = ds.getConnection()){
            System.out.println("1 : " +conn);
        } catch(Exception e){
            e.printStackTrace();
        }
    }
   
  
    @org.junit.Test
    public void factoryTest() {
        System.out.println("2 : " + sqlFactory);
      
    }
  
    @org.junit.Test
    public void sessionTest() throws Exception{
      
        try(SqlSession session = sqlFactory.openSession()) {
            System.out.println("3 : " + session);
        }catch(Exception e) {
            e.printStackTrace();
        }
    }
}