
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

public class AttendanceController extends Controller{

    AttendanceController()
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
            String yingdao = this.request.getParameter("yingdao");
            String shidao = this.request.getParameter("shidao");
            String workh = this.request.getParameter("workh");
            String status = this.request.getParameter("status");
            String qufen = this.request.getParameter("qufen");
            

            PreparedStatement stmt = this.conn.prepareStatement(
                            "update attendances set "
                                    + "employe_id=?,"
                                    + "kdate=?,"
                                    + "yingdao_t=?,"
                                    + "shidao_t=?,"
                                    + "work_h=?,"
                                    + "status=?,"
                                    + "qufen=?"
                                    + " where id=?");
            stmt.setInt(1, Integer.parseInt(employe_id));
            stmt.setString(2, date);
            stmt.setString(3, yingdao);
            stmt.setString(4, shidao);
            stmt.setString(5, workh);
            stmt.setString(6, status);
            stmt.setString(7, qufen);
            stmt.setInt(8,Integer.parseInt(id));
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
                "delete from attendances where id=?");
                
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
            
            String employe_id = this.request.getParameter("eid");
            String date = this.request.getParameter("date");
            String yingdao = this.request.getParameter("yingdao");
            String shidao = this.request.getParameter("shidao");
            String workh = this.request.getParameter("workh");
            String status = this.request.getParameter("status");
            String qufen = this.request.getParameter("qufen");

            PreparedStatement stmt = this.conn.prepareStatement(
                            "insert into attendances "
                                    + "(employe_id,"
                                    + "kdate,"
                                    + "yingdao_t,"
                                    + "shidao_t,"
                                    + "work_h,"
                                    + "status,"
                                    + "qufen)"
                                    + " values(?,?,?,?,?,?,?)");
            stmt.setInt(1, Integer.parseInt(employe_id));
            stmt.setString(2, date);
            stmt.setString(3,yingdao);
            stmt.setString(4,shidao);
            stmt.setString(5,workh);
            stmt.setString(6,status);
            stmt.setString(7,qufen);
            stmt.execute();

            tr="ok";
        
        }catch (Exception e2) {
            tr = e2.toString();
		}
        
        return tr;
        
    }
}

