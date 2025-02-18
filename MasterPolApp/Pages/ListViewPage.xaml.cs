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
    /// Логика взаимодействия для ListViewPage.xaml
    /// </summary>
    public partial class ListViewPage : Page
    {
        public ListViewPage()
        {
            InitializeComponent();
            LoadData();
        }

        public class PartnerViewModel
        {
            public int PartnerId { get; set; }
            public string NamePartner { get; set; } 
            public string TypePartner { get; set; } 
            public string NameDirector { get; set; } 
            public string NumberPhone { get; set; } 
            public decimal TotalSales { get; set; } 
            public int Discount { get; set; }

            public int Rating { get; set; }

            public string DiscountWithPercent => $"{Discount}%";
        }

        private void AddButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddEditPage(null));
        }

        private void EditButton_Click(object sender, RoutedEventArgs e)
        {
            Classes.Manager.MainFrame.Navigate(new Pages.AddEditPage((sender as Button).DataContext as Data.PartnerImport));
        }

        private void DataGridButton_Click(object sender, RoutedEventArgs e)
        {

        }
        private void LoadData()
        {
                           
           var salesData = Data.DatabaseMasterPolEntities.GetContext().PartnerProductImport
              .GroupBy(s => s.IdNamePartner)
              .Select(group => new
               {
                 PartnerId = group.Key,                  
                 TotalSales = group.Sum(s => s.QuantityProduct) }).ToList();
               
           var partnerData = Data.DatabaseMasterPolEntities.GetContext().PartnerImport
             .ToList()
             .GroupJoin(
             salesData,                              
             partner => partner.Id,      
             sales => sales.PartnerId,
             (partner, salesGroup) => new PartnerViewModel
              {
                PartnerId = partner.Id,
                NamePartner = partner.NamePartner,            
                TypePartner = partner.TypePartner.Type,       
                NameDirector = partner.NameDirector.Director, 
                NumberPhone = partner.NumberPhone,
                Rating = partner.Rating,
                TotalSales = salesGroup.FirstOrDefault().TotalSales,
                Discount = CalculateDiscount(salesGroup.FirstOrDefault().TotalSales)}).ToList();

                PartnerListView.ItemsSource = partnerData;
            
        }

        private static int CalculateDiscount(decimal totalSales)
        {
            if (totalSales < 10000)
                return 0;
            if (totalSales >= 10000 && totalSales <= 50000)
                return 5;
            if (totalSales > 50000 && totalSales <= 300000)
                return 10;
            return 15;
        }
    }
}
