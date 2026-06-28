import 'package:flutter/material.dart';
import 'package:shopping_list_app/data/categories.dart';

// شاشة إضافة عنصر جديد
class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

// الكلاس المسؤول عن حالة الشاشة
class _NewItemState extends State<NewItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // شريط العنوان أعلى الشاشة
      appBar: AppBar(title: const Text('Add a new item')),

      // محتوى الشاشة
      body: Padding(
        // إضافة مسافة حول المحتوى
        padding: const EdgeInsets.all(12),

        // نموذج يحتوي على حقول الإدخال
        child: Form(
          child: Column(
            children: [
              // حقل إدخال اسم المنتج
              TextFormField(
                // الحد الأقصى لعدد الأحرف
                maxLength: 50,

                // عنوان الحقل
                decoration: const InputDecoration(
                  label: Text('Name'),
                ),

                // التحقق من صحة الاسم
                validator: (value) {
                  if (value == null ||
                      value.isEmpty ||
                      value.trim().length <= 1 ||
                      value.trim().length > 50) {
                    return 'Must be between 1 and 50 characters.';
                  }

                  // إذا كانت البيانات صحيحة
                  return null;
                },
              ),

              // صف يحتوي على الكمية والتصنيف
              Row(
                // محاذاة العناصر لأسفل
                crossAxisAlignment: CrossAxisAlignment.end,

                children: [
                  // يجعل الحقل يأخذ نصف المساحة
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        label: Text('Quantity'),
                      ),

                      // القيمة الافتراضية
                      initialValue: '1',

                      // التحقق من صحة الكمية
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            int.tryParse(value) == null ||
                            int.tryParse(value)! <= 0) {
                          return 'Must be a valid, positive number.';
                        }

                        // الكمية صحيحة
                        return null;
                      },
                    ),
                  ),

                  // مسافة بين الحقلين
                  const SizedBox(width: 8),

                  // يجعل القائمة المنسدلة تأخذ بقية المساحة
                  Expanded(
                    child: DropdownButtonFormField(
                      // عناصر القائمة المنسدلة
                      items: [
                        // إنشاء عنصر لكل تصنيف موجود في categories
                        for (final category in categories.entries)
                          DropdownMenuItem(
                            // القيمة التي سيتم إرجاعها عند الاختيار
                            value: category.value,

                            // شكل العنصر داخل القائمة
                            child: Row(
                              children: [
                                // مربع يعرض لون التصنيف
                                Container(
                                  width: 16,
                                  height: 16,
                                  color: category.value.color,
                                ),

                                // مسافة بين اللون والنص
                                const SizedBox(width: 6),

                                // اسم التصنيف
                                Text(category.value.title),
                              ],
                            ),
                          ),
                      ],

                      // يتم استدعاؤها عند تغيير التصنيف
                      onChanged: (value) {},
                    ),
                  ),
                ],
              ),

              // مسافة قبل الأزرار
              const SizedBox(height: 12),

              // صف يحتوي على الأزرار
              Row(
                // وضع الأزرار في نهاية الصف
                mainAxisAlignment: MainAxisAlignment.end,

                children: [
                  // زر إعادة تعيين الحقول
                  TextButton(
                    onPressed: () {},
                    child: const Text('Reset'),
                  ),

                  // زر إضافة العنصر
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Add Item'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}