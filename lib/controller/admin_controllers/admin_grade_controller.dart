import 'package:top_jobs/datasource/remote_datasources/admin_datasource/admin_grade_datasource.dart';
import 'package:top_jobs/model/admins/grade_model.dart';

class AdminGradeController {
  final AdminGradeDatasource _datasource;
  final String contact; // Foydalanuvchi kontaktini saqlash uchun

  AdminGradeController({
    required String contact,
    required String companyId,
    required String jobId,
  }) : _datasource = AdminGradeDatasource(
         contact: contact,
         companyId: companyId,
         jobId: jobId,
       ),
       contact = contact;

  // Ma'lumotlarni olish
  Future<List<GradeModel>> getGrades() async {
    try {
      return await _datasource.getData();
    } catch (e) {
      print("Xatolik yuz berdi: $e");
      return [];
    }
  }

  // Yangi grade qo'shish
  Future<bool> addGrade(GradeModel grade) async {
    try {
      await _datasource.setData(gradeModel: grade);
      return true;
    } catch (e) {
      print("Qo'shishda xatolik: $e");
      return false;
    }
  }

  // Mavjud grade'ni tahrirlash
  Future<bool> updateGrade(String id, GradeModel grade) async {
    try {
      await _datasource.editData(id: id, gradeModel: grade);
      return true;
    } catch (e) {
      print("Tahrirlashda xatolik: $e");
      return false;
    }
  }

  // Grade'ni o'chirish
  Future<bool> deleteGrade(String id) async {
    try {
      await _datasource.delete(id: id);
      return true;
    } catch (e) {
      print("O'chirishda xatolik: $e");
      return false;
    }
  }

  // Baholashni o'rnatish
  Future<bool> setRating(int rating) async {
    try {
      // Avval barcha ma'lumotlarni olamiz
      final grades = await _datasource.getData();

      // Joriy foydalanuvchi kontakti bo'yicha qidiramiz
      GradeModel? userGrade;
      String? gradeId;

      // Foydalanuvchining mavjud bahosini qidiramiz
      for (var grade in grades) {
        if (grade.contact == contact) {
          userGrade = grade;
          // Firebase dan olingan ma'lumotlarda id qo'shilgani uchun dynamic cast qilib olamiz
          gradeId = (grade as dynamic).id;
          break;
        }
      }

      // Yangi yoki yangilangan GradeModel
      final gradeModel = GradeModel(contact: contact, grade: rating);

      if (userGrade != null && gradeId != null) {
        // Mavjud grade topildi - update qilamiz
        await _datasource.editData(id: gradeId, gradeModel: gradeModel);
      } else {
        // Mavjud grade topilmadi - yangi yaratamiz
        await _datasource.setData(gradeModel: gradeModel);
      }

      return true;
    } catch (e) {
      print("Baholashni o'rnatishda xatolik: $e");
      return false;
    }
  }
}
