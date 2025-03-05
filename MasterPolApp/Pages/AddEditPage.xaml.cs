using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Remoting.Contexts;
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
                    IndexTextBox.Text = string.Empty;
                    NameDirectorTextBox.Text = string.Empty;
                    NumberPhoneTextBox.Text = string.Empty;
                    EmailTextBox.Text = string.Empty;
                    AreaTextBox.Text = string.Empty;
                    CityTextBox.Text = string.Empty;
                    StreetTextBox.Text = string.Empty;
                    HousTextBox.Text = string.Empty;

                }
                else if (FlagAddOrEdit == "edit")
                {

                    NamePartnerTextBox.Text = CurrentProduct.NamePartner;
                    TypePartnerComboBox.SelectedItem = Data.DatabaseMasterPolEntities.GetContext().TypePartner
                        .Where(d => d.Id == CurrentProduct.IdTypePartner).FirstOrDefault();
                    RetingTextBox.Text = CurrentProduct.Rating.ToString();
                    NameDirectorTextBox.Text = CurrentProduct.NameDirector.Director;
                    NumberPhoneTextBox.Text = CurrentProduct.NumberPhone;
                    EmailTextBox.Text = CurrentProduct.Email;
                    IndexTextBox.Text = CurrentProduct.Address.NumberIndex.NameIndex.ToString();
                    AreaTextBox.Text = CurrentProduct.Address.NameArea.Area;
                    CityTextBox.Text = CurrentProduct.Address.NameCity.City;
                    StreetTextBox.Text = CurrentProduct.Address.NameStreet.Street;
                    HousTextBox.Text = CurrentProduct.Address.Home.ToString();

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


                if (string.IsNullOrEmpty(IndexTextBox.Text))
                {
                    errors.AppendLine("Введите индекс!");
                }
                else
                {
                    var countParse = Int32.TryParse(IndexTextBox.Text, out var result);
                    if (!(countParse && result >= 0))
                    {
                        errors.AppendLine("К-во - целое и положительное");
                    }
                }
                if (string.IsNullOrEmpty(CityTextBox.Text))
                {
                    errors.AppendLine("Введите город!");
                }
                if (string.IsNullOrEmpty(StreetTextBox.Text))
                {
                    errors.AppendLine("Введите улица!");
                }
                if (string.IsNullOrEmpty(AreaTextBox.Text))
                {
                    errors.AppendLine("Введите область!");
                }
                if (string.IsNullOrEmpty(HousTextBox.Text))
                {
                    errors.AppendLine("Введите дом!");
                }
                else
                {
                    var countParse = Int32.TryParse(HousTextBox.Text, out var result);
                    if (!(countParse && result >= 0))
                    {
                        errors.AppendLine("К-во - целое и положительное");
                    }
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

                var address = new Data.Address();
                var IndexText = Convert.ToInt32(IndexTextBox.Text);

                var searchStreet = (from item in Data.DatabaseMasterPolEntities.GetContext().NameStreet
                                  where item.Street == StreetTextBox.Text
                                  select item).FirstOrDefault();

                if (searchStreet != null)
                {
                    address.IdStreet = searchStreet.Id;
                }
                else
                {
                    Data.NameStreet nameStreet = new Data.NameStreet()
                    {
                        Street = StreetTextBox.Text
                    };
                    Data.DatabaseMasterPolEntities.GetContext().NameStreet.Add(nameStreet);
                    Data.DatabaseMasterPolEntities.GetContext().SaveChanges();
                    address.IdStreet = nameStreet.Id;
                }

                var searchCity = (from item in Data.DatabaseMasterPolEntities.GetContext().NameCity
                                  where item.City == CityTextBox.Text
                                  select item).FirstOrDefault();

                if (searchCity != null)
                {
                    address.IdCity = searchCity.Id;
                }
                else
                {
                    Data.NameCity nameCity = new Data.NameCity()
                    {
                        City = CityTextBox.Text
                    };
                    Data.DatabaseMasterPolEntities.GetContext().NameCity.Add(nameCity);
                    Data.DatabaseMasterPolEntities.GetContext().SaveChanges();
                    address.IdCity = nameCity.Id;
                }

                var searchArea = (from item in Data.DatabaseMasterPolEntities.GetContext().NameArea
                                   where item.Area == AreaTextBox.Text
                                   select item).FirstOrDefault();

                if (searchArea != null)
                {
                    address.IdArea = searchArea.Id;
                }
                else
                {
                    Data.NameArea nameArea = new Data.NameArea()
                    {
                        Area = AreaTextBox.Text
                    };
                    Data.DatabaseMasterPolEntities.GetContext().NameArea.Add(nameArea);
                    Data.DatabaseMasterPolEntities.GetContext().SaveChanges();
                    address.IdArea = nameArea.Id;
                }

                var searchIndex = (from item in Data.DatabaseMasterPolEntities.GetContext().NumberIndex
                                  where item.NameIndex == IndexText
                                   select item).FirstOrDefault();

                if (searchIndex != null)
                {
                    address.IdIndex = searchIndex.Id;
                }
                else
                {
                    Data.NumberIndex numberIndex = new Data.NumberIndex()
                    {
                        NameIndex = IndexText
                    };
                    Data.DatabaseMasterPolEntities.GetContext().NumberIndex.Add(numberIndex);
                    Data.DatabaseMasterPolEntities.GetContext().SaveChanges();
                    address.IdIndex = numberIndex.Id;
                }

                var searchName = (from item in Data.DatabaseMasterPolEntities.GetContext().NameDirector
                                  where item.Director == NameDirectorTextBox.Text
                                  select item).FirstOrDefault();

                if (searchName != null)
                {
                    CurrentProduct.IdNameDirector = searchName.Id;
                }
                else
                {
                    Data.NameDirector directorName = new Data.NameDirector()
                    {
                        Director = NameDirectorTextBox.Text
                    };
                    Data.DatabaseMasterPolEntities.GetContext().NameDirector.Add(directorName);
                    Data.DatabaseMasterPolEntities.GetContext().SaveChanges();
                    CurrentProduct.IdNameDirector = directorName.Id;
                }
                Data.DatabaseMasterPolEntities.GetContext().Address.Add(address);
                Data.DatabaseMasterPolEntities.GetContext().SaveChanges();

                CurrentProduct.Email = EmailTextBox.Text;
                CurrentProduct.NumberPhone = NumberPhoneTextBox.Text;
                CurrentProduct.Rating = Convert.ToInt32(RetingTextBox.Text);
                var selectType = TypePartnerComboBox.SelectedItem as Data.TypePartner;
                CurrentProduct.IdTypePartner = selectType.Id;
                CurrentProduct.NamePartner = NamePartnerTextBox.Text;
                address.Home = Convert.ToInt32(HousTextBox.Text);
                CurrentProduct.IdAddress = address.Id;
                if (FlagAddOrEdit == "add")
                {
                    Data.DatabaseMasterPolEntities.GetContext().Address.Add(address);
                    Data.DatabaseMasterPolEntities.GetContext().PartnerImport.Add(CurrentProduct);
                    Data.DatabaseMasterPolEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно добавлено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);
                }
                else if (FlagAddOrEdit == "edit")
                {
                    Data.DatabaseMasterPolEntities.GetContext().SaveChanges();
                    MessageBox.Show("Успешно сохранено!", "Успех!", MessageBoxButton.OK, MessageBoxImage.Information);

                }
            }
            catch (System.Data.Entity.Validation.DbEntityValidationException ex)
            {
                foreach (var validationErrors in ex.EntityValidationErrors)
                {
                    foreach (var validationError in validationErrors.ValidationErrors)
                    {
                        MessageBox.Show($"Ошибка в поле {validationError.PropertyName}: {validationError.ErrorMessage}");
                    }
                }
            }
            catch (System.Data.Entity.Infrastructure.DbUpdateException ex)
            {
                MessageBox.Show($"Ошибка обновления: {ex.InnerException?.InnerException?.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Неизвестная ошибка: {ex.Message}", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Error);
            }
        }

        private void BackButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.ListViewPage());
        }
    }
}
