using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Metod
{
    internal class Program
    {
        static void Main()
        {
            //опять этот мастер пол
            using (var context = Data.DatabaseMasterPolEntities.GetContext()) 
            {
                // переменная для цикла
                bool changeSelection = true;

                //пока он тру прога работает
                while (changeSelection)
                {
                    // СПИСОК ПРОДУКТОВ
                    Console.WriteLine("Список доступных продуктов:");
                    var products = context.ProductImport.ToList();
                    foreach (var prod in products)
                    {
                        Console.WriteLine($"ID: {prod.Id} | Название: {prod.NameProduct}");
                    }
                    // АЙДИ ПРОДУКТА
                    Console.Write("Введите ID продукта: ");
                    int selectedProductId;
                    while (!int.TryParse(Console.ReadLine(), out selectedProductId) || !products.Any(p => p.Id == selectedProductId))
                    {
                        Console.Write("-1");
                        return;
                    }

                    var product = products.First(p => p.Id == selectedProductId);
                    int typeProductId = product.IdTypeProduct;

                    // СПИСОК МАТЕРИАЛЫ
                    Console.WriteLine("\nСписок доступных материалов:");
                    var materials = context.MaterialTypeImport.ToList();
                    foreach (var mat in materials)
                    {
                        Console.WriteLine($"ID: {mat.Id} | Тип материала: {mat.TypeMaterial} | Брак: {mat.PercentOfMaterialDefects * 100}%");
                    }
                    //АЙДИ МАТЕРИАЛА
                    Console.Write("Введите ID материала: ");
                    int selectedMaterialId;
                    while (!int.TryParse(Console.ReadLine(), out selectedMaterialId) || !materials.Any(m => m.Id == selectedMaterialId))
                    {
                        Console.Write("-1");
                        return;
                    }

                    var material = materials.First(m => m.Id == selectedMaterialId);
                    string typeMaterialName = material.TypeMaterial;
                    double materialDefectPercent = (double)material.PercentOfMaterialDefects;

                    // параметры 
                    Console.Write("Введите количество продукции: ");
                    int productQuantity;
                    while (!int.TryParse(Console.ReadLine(), out productQuantity) || productQuantity <= 0)
                    {
                        Console.Write("Введите корректное количество (целое число > 0): ");
                    }
                    // первый параметр 
                    Console.Write("Введите первый параметр продукции (вещественное число): ");
                    double param1;
                    while (!double.TryParse(Console.ReadLine(), out param1) || param1 <= 0)
                    {
                        Console.Write("Введите корректное значение (вещественное число > 0): ");
                    }
                    // второй параметр 
                    Console.Write("Введите второй параметр продукции (вещественное число): ");
                    double param2;
                    while (!double.TryParse(Console.ReadLine(), out param2) || param2 <= 0)
                    {
                        Console.Write("Введите корректное значение (вещественное число > 0): ");
                    }

                    // коэффициент 
                    var productTypeCoef = context.ProductTypeImport
                        .Where(p => p.Id == typeProductId)
                        .Select(p => p.ProductTypeCoef)
                        .FirstOrDefault();

                    if (productTypeCoef == 0)
                    {
                        Console.WriteLine("Ошибка: Коэффициент типа продукции не найден.");
                        return;
                    }

                    // Какая то математика
                    double baseMaterialAmount = productQuantity * param1 * param2 * (double)productTypeCoef;
                    double finalMaterialAmount = baseMaterialAmount * (1 + materialDefectPercent);


                    Console.WriteLine("\n=== Итоговый расчет ===");
                    Console.WriteLine($"Выбранный продукт: {product.NameProduct}");
                    Console.WriteLine($"Тип материала: {typeMaterialName} (ID: {selectedMaterialId})");
                    Console.WriteLine($"Коэффициент типа продукции: {productTypeCoef}");
                    Console.WriteLine($"Процент брака материала: {materialDefectPercent * 100}%");
                    Console.WriteLine($"Базовое количество материала: {baseMaterialAmount}");
                    Console.WriteLine($"Окончательное количество материала (с браком): {Math.Ceiling(finalMaterialAmount)}");

                 
                    Console.Write("\nХотите изменить продукт или материал? (да/нет): ");
                    string answer = Console.ReadLine()?.Trim().ToLower();

                    if (answer != "да")
                    {
                        changeSelection = false;
                    }
                }

                Console.WriteLine("\nНажмите Enter, чтобы закрыть программу...");
                Console.ReadLine();
            }
        }
    }
}

