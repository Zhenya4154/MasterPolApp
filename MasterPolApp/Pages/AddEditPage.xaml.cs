using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace MasterPolApp.Pages
{
    /// <summary>
    /// Логика взаимодействия для AddEditPage.xaml
    /// </summary>
    public partial class AddEditPage : Page
    {
        public Data.PartnerImport CurrentProduct = new Data.PartnerImport();
        public string FlagAddOrEdit = "default";
        public AddEditPage(Data.PartnerImport _partner)
        {
            InitializeComponent();
            if (_partner != null)
            {
                CurrentProduct = _partner;
                FlagAddOrEdit = "edit";
            }
            else
            {
                FlagAddOrEdit = "add";
            }

            DataContext = CurrentProduct;

            Init();
           
        }

        private void Init()
        {
            try
            {
                TypePartnerComboBox.ItemsSource = Data.DatabaseMasterPolEntities.GetContext().TypePartner.ToList();
                if (FlagAddOrEdit == "add")
                {
                    NamePartnerTextBox.Text = string.Empty;
                    TypePartnerComboBox.SelectedItem = null;
                    RetingTextBox.Text = string.Empty;
                    AddressTextBox.Text = string.Empty;
                    NameDirectorTextBox.Text = string.Empty;
                    NumberPhoneTextBox.Text = string.Empty;
                    EmailTextBox.Text = string.Empty;

                }
                else if (FlagAddOrEdit == "edit")
                {

                    NamePartnerTextBox.Text = CurrentProduct.NamePartner;
                    TypePartnerComboBox.SelectedItem = Data.DatabaseMasterPolEntities.GetContext().TypePartner
                        .Where(d => d.Id == CurrentProduct.IdTypePartner).FirstOrDefault();
                    RetingTextBox.Text = CurrentProduct.Rating.ToString();
                    NameDirectorTextBox.Text = CurrentProduct.NameDirector.Director;
                    NumberPhoneTextBox.Text = CurrentProduct.NumberPhone;
                    
                }
            }
            catch
            {

            }
            

        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                StringBuilder errors = new StringBuilder();
                if (string.IsNullOrEmpty(NamePartnerTextBox.Text))
                {
                    errors.AppendLine("Зполните наименование партнера!");
                }
                if (TypePartnerComboBox.SelectedItem == null)
                {
                    errors.AppendLine("Необходимо выбрать тип партнера!");
                }
                if (string.IsNullOrEmpty(RetingTextBox.Text))
                {
                    errors.AppendLine("Введите рейтинг!");
                }
                else
                {
                    var countParse = Int32.TryParse(RetingTextBox.Text, out var result);
                    if (!(countParse && result >= 0))
                    {
                        errors.AppendLine("К-во - целое и положительное");
                    }
                }


                if (string.IsNullOrEmpty(AddressTextBox.Text))
                {
                    errors.AppendLine("Введите адрес!");
                }
                
                if (string.IsNullOrEmpty(NameDirectorTextBox.Text))
                {
                    errors.AppendLine("Введите ФИО директора!");
                }
                if (string.IsNullOrEmpty(NumberPhoneTextBox.Text))
                {
                    errors.AppendLine("Заполните номер телефона!");
                }
                if (string.IsNullOrEmpty(EmailTextBox.Text))
                {
                    errors.AppendLine("Заполните почту!");
                }

                if (errors.Length > 0)
                {
                    MessageBox.Show(errors.ToString(), "Ошибка!", MessageBoxButton.OK, MessageBoxImage.Error);
                    return;
                }
            }
            catch
            {

            }
            }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ListViewPage());
        }
    }
}
