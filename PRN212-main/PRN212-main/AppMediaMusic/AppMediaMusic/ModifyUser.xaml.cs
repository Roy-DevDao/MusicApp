using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using AppMediaMusic.BLL.Services;
using AppMediaMusic.DAL.Entities;

namespace AppMediaMusic
{
    /// <summary>
    /// Interaction logic for ModifyUser.xaml
    /// </summary>
    public partial class ModifyUser : Window
    {
        public User User { get; private set; }

        UserService userService;
        public ModifyUser()
        {
            InitializeComponent();
            userService = new UserService();
        }

        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            User admin = new User();
            admin.Username = txtUsername.Text;
            admin.Password = txtPassword.Text;
            admin.Role = 0;
            userService.AddAdmin(admin);
            MessageBox.Show("Admin successfully!");
            this.Close();
        }

        private void CancelButton_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }
    }
}
