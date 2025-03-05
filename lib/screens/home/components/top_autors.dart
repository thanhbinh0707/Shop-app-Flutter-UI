import 'package:flutter/material.dart';
import 'package:shop_app/models/autors.dart';

import 'section_title.dart';

class TopAutors extends StatelessWidget {
  const TopAutors({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SectionTitle(
            title: "Top autors",
            press: () {},
          ),
        ),
        const SizedBox(height: 0), // Khoảng cách giữa tiêu đề và danh sách
        SizedBox(
          height: 90,
          child: Padding(
            padding:
                const EdgeInsets.only(left: 20), // Dịch toàn bộ sang trái 20px
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Container(
                      height: 60,
                      width: 60,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage(categories[index].image),
                          fit: BoxFit.cover, // Đảm bảo hình ảnh hiển thị đầy đủ
                        ),
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      categories[index].title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: categories.length,
            ),
          ),
        )
      ],
    );
  }
}
