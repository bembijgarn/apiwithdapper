using BS_API.DOMAIN;
using Dapper;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Threading.Tasks;

namespace BS_API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class UserController : ControllerBase
    {
        private readonly IConfiguration _config;
        public UserController(IConfiguration config)
        {
            _config = config;
        }

        [HttpGet("GetAllUser")]
        public async Task<ActionResult<List<User>>> GetAll()
        {
            try
            {
                var connection = new SqlConnection(_config.GetConnectionString("name"));
                string procedurename = "selectall";
                var dbuser = await connection.QueryAsync<User>(procedurename, commandType: System.Data.CommandType.StoredProcedure);
                if (dbuser.Count() == 0)
                {
                    throw new ArgumentNullException(nameof(dbuser));
                }
                return Ok(dbuser);
            }
            catch (SqlException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (ArgumentNullException ex)
            {
                return BadRequest(ex.Message);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpGet("GetUserByid/{Id}")]
        public async Task<ActionResult<List<User>>> GetUserbyId(int Id)
        {
            try
            {
                var connection = new SqlConnection(_config.GetConnectionString("name"));
                string procedurename = "getuserbyid";
                var parameters = new DynamicParameters();
                parameters.Add("userid", Id);
                var dbuser = await connection.QueryFirstAsync<User>(procedurename, parameters, commandType: System.Data.CommandType.StoredProcedure);
                return Ok(dbuser);
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPost("AddUser")]
        public async Task<ActionResult<List<User>>> Adduser(User user)
        {
            try
            {
                var connection = new SqlConnection(_config.GetConnectionString("name"));
                string procedurename = "Adduser";
                var parameters = new DynamicParameters();
                parameters.Add("name", user.Name);
                parameters.Add("lastname", user.LastName);
                parameters.Add("username", user.UserName);
                parameters.Add("cardnumber", user.BankCard);

                var dbuser = await connection.ExecuteAsync(procedurename, parameters, commandType: System.Data.CommandType.StoredProcedure);

                return Ok(new
                {
                    name = user.Name,
                    lastname = user.LastName,
                    username = user.UserName,
                    cardnumber = user.BankCard
                });
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpDelete("DeleteUserByfirstnameANDlastname/{firstname}/{lastname}")]
        public async Task<ActionResult<List<User>>> DeleteuserByfullname(string firstname,string lastname)
        {
            try
            {
                var connection = new SqlConnection(_config.GetConnectionString("name"));
                var procedurename = "deleteuser";
                var parameters = new DynamicParameters();
                parameters.Add("firstname", firstname);
                parameters.Add("lastname", lastname);
                var dbuser = await connection.ExecuteAsync(procedurename, parameters, commandType: System.Data.CommandType.StoredProcedure);
                if (dbuser == 0)
                {
                    return BadRequest("Sorry,Invalid User");
                }
                return Ok($"User - \"{firstname} {lastname}\" Permamently Deleted!");
            }
            catch (Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
        [HttpPut("UpdateuserbyID/{Id}")]
        public async Task<ActionResult<List<User>>> UpdateuserbyId([FromBody]User Updateduser,int Id)
        {
            try
            {
                var connection = new SqlConnection(_config.GetConnectionString("name"));

                var procedurename = "updateuserbyid";
                var parameters = new DynamicParameters();
                parameters.Add("Id", Id);
                parameters.Add("name", Updateduser.Name);
                parameters.Add("lastname", Updateduser.LastName);
                parameters.Add("username", Updateduser.UserName);
                parameters.Add("cardnumber", Updateduser.BankCard);

                var dbuser = await connection.ExecuteAsync(procedurename, parameters, commandType: System.Data.CommandType.StoredProcedure);
                if (dbuser == 0)
                {
                    return BadRequest("Sorry,Invalid Id");
                }

                return Ok("User successfully Updated");
            }catch(Exception ex)
            {
                return BadRequest(ex.Message);
            }
        }
    }
}
