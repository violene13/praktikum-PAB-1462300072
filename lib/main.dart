import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

Widget buildBottomNav(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    currentIndex: currentIndex,
    type: BottomNavigationBarType.fixed,
    selectedItemColor: Colors.blue,
    unselectedItemColor: Colors.black54,
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: "Home",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.description),
        label: "Detail",
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person_outline),
        label: "Profile",
      ),
    ],
    onTap: (index) {
      if (index == currentIndex) return;

      if (index == 0) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const PetPage(),
          ),
        );
      }

      if (index == 1) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const CatDetailPage(),
          ),
        );
      }

      if (index == 2) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (_) => const ProfilePage(),
          ),
        );
      }
    },
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
    );
  }
}

// ================= HALAMAN WELCOME =================

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
return Scaffold(
  backgroundColor: Colors.grey[200],

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            const Text(
              "Welcome to",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),

            const Text(
              "PRAKTIKUM PAB 2026",
              style: TextStyle(
                fontSize: 20,
              ),
            ),

            const SizedBox(height: 40),

            const Text(
              "1462300072",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 30),

            Image.asset(
              'assets/profile2.jpeg',
              height: 220,
            ),

            const SizedBox(height: 20),
            const Text(
              "Violene Maretha T",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {

               Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const PetPage(),
                ),
              );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.greenAccent,
                minimumSize: const Size(220, 60),

                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: const Text(
                "Masuk",
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PetPage extends StatelessWidget {
  const PetPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: const Color(0xffE8F5E9),
  bottomNavigationBar: buildBottomNav(context, 0),

      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            children: [

              // GAMBAR HEADER
              Stack(
                children: [

                  ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/pet.jpg',
                      height: 220,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),

                  // TEXT PET ADOPT
                const Positioned(
  left: 20,
  bottom: 45,
  child: Text(
    "Pet Adopt",
    style: TextStyle(
      color: Colors.white,
      fontSize: 30,
      fontWeight: FontWeight.bold,
    ),
  ),
),

const Positioned(
  left: 20,
  bottom: 20,
  child: Text(
    "Hewan kami yang lucu dan manis",
    style: TextStyle(
      color: Colors.white,
      fontSize: 15,
      fontWeight: FontWeight.bold,
    ),
  ),
),                ],
              ),

              const SizedBox(height: 30),

              // GRID MENU
              Expanded(
                child:GridView.count(
                physics: const BouncingScrollPhysics(),
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
               children: [

                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const CatDetailPage(),
                      ),
                    );
                  },
                  child: const PetMenu(
                    icon: Icons.pets,
                    title: "Kucing",
                  ),
                ),

                const PetMenu(
                  icon: Icons.pets,
                  title: "Anjing",
                ),

                const PetMenu(
                  icon: Icons.cruelty_free,
                  title: "Kelinci",
                ),

                const PetMenu(
                  icon: Icons.flutter_dash,
                  title: "Burung",
                ),

                const PetMenu(
                  icon: Icons.set_meal,
                  title: "Ikan",
                ),

                const PetMenu(
                  icon: Icons.pets,
                  title: "Hamster",
                ),

                const PetMenu(
                  icon: Icons.pets,
                  title: "Kura-Kura",
                ),

                const PetMenu(
                  icon: Icons.pets,
                  title: "Rubah",
                ),

                const PetMenu(
                  icon: Icons.pets,
                  title: "Ayam",
                ),

                const PetMenu(
                  icon: Icons.pets,
                  title: "Panda",
                ),
              ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ================= DETAIL KUCING =================

class CatDetailPage extends StatelessWidget {
  const CatDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
  backgroundColor: const Color(0xffE8F5E9),

  appBar: AppBar(
    backgroundColor: const Color(0xffE8F5E9),
    elevation: 0,
    leading: IconButton(
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.black,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: const Text(
      "Detail Kucing",
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  bottomNavigationBar: buildBottomNav(context, 1), // tambahkan ini

  body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(20),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              // FOTO KUCING
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  'assets/cat.jpg',
                  height: 250,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),

              const SizedBox(height: 20),

              // NAMA
              const Text(
                "Luna",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Tentang Luna",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Luna adalah kucing lucu yang tinggal "
                "bersama di kota Surabaya sejak kecil. "
                "Dia suka bermain dan sangat menggemaskan.",
                style: TextStyle(
                  fontSize: 16,
                ),
              ),

              const Spacer(),

              // BUTTON AJUKAN ADOPSI
              SizedBox(
  width: double.infinity,
  height: 55,
  child: ElevatedButton(
    onPressed: () {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            title: const Row(
              children: [
                Icon(
                  Icons.calendar_month,
                  color: Colors.blue,
                  size: 28,
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    "Jadwalkan Kunjungan?",
                  ),
                ),
              ],
            ),
            content: const Text(
              "Ingin melakukan pertemuan dengan Luna di shelter adopsi?",
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Batal"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Kunjungan berhasil dijadwalkan!",
                      ),
                    ),
                  );
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.black87,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: const Text(
      "AJUKAN ADOPSI",
      style: TextStyle(
        fontSize: 18,
        color: Colors.white,
      ),
    ),
  ),
),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  Widget profileItem(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 15,
      ),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            color: Colors.lightBlue,
          ),
          const SizedBox(width: 20),
          Text(
            text,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: buildBottomNav(context, 2),

      body: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            decoration: const BoxDecoration(
              color: Color(0xffE8F0FF),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(150),
                bottomRight: Radius.circular(150),
              ),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 40),

                Text(
                  "Profile",
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 20),

                CircleAvatar(
                  radius: 40,
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.person_outline,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ),

          profileItem(Icons.person_outline, "PAB 2025"),
          profileItem(Icons.phone_outlined, "1462300072"),
          profileItem(Icons.email_outlined, "pab2023@gmail.com"),
          profileItem(Icons.location_on_outlined, "Surabaya"),
          profileItem(Icons.camera_alt_outlined, "pab2023"),
        ],
      ),
    );
  }
}

class PetMenu extends StatelessWidget {
  final IconData icon;
  final String title;

  const PetMenu({
    super.key,
    required this.icon,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.green,
          width: 2,
        ),

        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Icon(
            icon,
            size: 45,
            color: Colors.brown,
          ),

          const SizedBox(height: 10),

          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}