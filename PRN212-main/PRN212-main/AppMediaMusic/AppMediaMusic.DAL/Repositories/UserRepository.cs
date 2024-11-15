using AppMediaMusic.DAL.Entities;
using Microsoft.EntityFrameworkCore;
using System.Linq;

namespace AppMediaMusic.DAL.Repositories
{
    public class UserRepository
    {

        private AssignmentPrnContext _context;

        public UserRepository()
        {
            _context = new AssignmentPrnContext();
        }

        public User? User(string username, string password)
        {
            _context = new AssignmentPrnContext();
            return _context.Users.FirstOrDefault(x => x.Username.ToLower() == username && x.Password == password);
        }

        public void AddUser(User user)
        {
            _context.Users.Add(user);
            _context.UserProfiles.Add(user.UserProfile);
            _context.SaveChanges();
        }
        public List<User> GetAll()
        {
            return _context.Users.Include("UserProfile").ToList();
        }
        public void UpdateUser(User user)
        {
            _context.Users.Update(user);
            _context.SaveChanges();
        }
        public void DeleteUser(User user)
        {
            _context.Users.Remove(user);
            _context.SaveChanges();
        }

    }
}