
import java.sql.PreparedStatement;
import javax.servlet.http.HttpServletRequest;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author 毛畅
 */


public class WageController extends Controller{
    
    WageController()
    {
        super();
    }
    
    public boolean checkForm()
    {
        return true;
    }
    public String update()
    {
        String rs = "";
        
        try{
            
            String employe_id = this.request.getParameter("eid");
            String id = this.request.getParameter("id");
            String date = this.request.getParameter("date");
            String jiben = this.request.getParameter("jiben");
            String ticheng = this.request.getParameter("ticheng");
            String jiangli = this.request.getParameter("jiangli");
            String jiaban = this.request.getParameter("jiaban");
            String other = this.request.getParameter("other");
            String beizhu = this.request.getParameter("beizhu");

            PreparedStatement stmt = this.conn.prepareStatement(
                            "update wages set "
                                    + "employe_id=?,"
                                    + "wdate=?,"
                                    + "wjiben=?,"
                                    + "wticheng=?,"
                                    + "wjiangli=?,"
                                    + "wjiaban=?,"
                                    + "wother=?,"
                                    + "beizhu=?"
                                    + " where id=?");
            stmt.setInt(1, Integer.parseInt(employe_id));
            stmt.setString(2, date);
            stmt.setInt(3,Integer.parseInt(jiben));
            stmt.setInt(4,Integer.parseInt(ticheng));
            stmt.setInt(5,Integer.parseInt(jiangli));
            stmt.setInt(6,Integer.parseInt(jiaban));
            stmt.setInt(7,Integer.parseInt(other));
            stmt.setString(8,beizhu);
            stmt.setInt(9,Integer.parseInt(id));
            stmt.execute();

            rs="ok";
        
        }catch (Exception e2) {
            rs = e2.toString();
		}
        
        return rs;
        
    }
    public String delete()
    {
        String tr ="unknow";
        try{
            String id = this.request.getParameter("id");
            PreparedStatement stmt = this.conn.prepareStatement(
                "delete from wages where id=?");
                
            stmt.setInt(1, Integer.parseInt(id));
            stmt.execute();
            tr="ok";
        
        }catch (Exception e2) {
            tr = e2.toString();
		}
        
        return tr;
    }
    public String save()
    {
        String tr ="unknow";
        try{
            
            String employe_id = request.getParameter("eid");
            String date = request.getParameter("date");
            String jiben = request.getParameter("jiben");
            String ticheng = request.getParameter("ticheng");
            String jiangli = request.getParameter("jiangli");
            String jiaban = request.getParameter("jiaban");
            String other = request.getParameter("other");
            String beizhu = request.getParameter("beizhu");

            PreparedStatement stmt = this.conn.prepareStatement(
                            "insert into wages "
                                    + "(employe_id,"
                                    + "wdate,"
                                    + "wjiben,"
                                    + "wticheng,"
                                    + "wjiangli,"
                                    + "wjiaban,"
                                    + "wother,"
                                    + "beizhu) "
                                    + "values(?,?,?,?,?,?,?,?)");
            stmt.setInt(1, Integer.parseInt(employe_id));
            stmt.setString(2, date);
            stmt.setInt(3,Integer.parseInt(jiben));
            stmt.setInt(4,Integer.parseInt(ticheng));
            stmt.setInt(5,Integer.parseInt(jiangli));
            stmt.setInt(6,Integer.parseInt(jiaban));
            stmt.setInt(7,Integer.parseInt(other));
            stmt.setString(8,beizhu);
            stmt.execute();

            tr="ok";
        
        }catch (Exception e2) {
            tr = e2.toString();
		}
        
        return tr;
        
    }
}
