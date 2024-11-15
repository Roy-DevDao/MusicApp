using AppMediaMusic.DAL;
using AppMediaMusic.DAL.Entities;
using AppMediaMusic.DAL.Repositories;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace AppMediaMusic.BLL.Services
{
    public class UserService
    {
        private UserRepository _repo = new UserRepository();
        public User Authenticate(string user, string pass)
        {
            return _repo.User(user, pass);
        }

        public bool CreateUser(User user)
        {
            try
            {
                _repo.AddUser(user);
                return true;
            }
            catch
            {
                return false;
            }
        }

        public void AddUser(User user)
        {
            _repo.AddUser(user);
        }

        public List<User> GetAll()
        {
            return _repo.GetAll();
        }

        public void UpdateUser(User user)
        {
            _repo.UpdateUser(user);
        }

        public void DeleteUser(User user)
        {
            _repo.DeleteUser(user);
        }

        public void ForgotPassword(string email, string password)
        {
            AssignmentPrnContext assignmentPrnContext = new();
            User user = assignmentPrnContext.Users.Include("UserProfile").FirstOrDefault(u => u.UserProfile.Email == email);
            if (user != null)
            {
                user.Password = password;
                assignmentPrnContext.SaveChanges();
            }
        }
    }
}
