import 'package:top_jobs/datasource/remote_datasources/admin_datasource/admin_comment_datasource.dart';
import 'package:top_jobs/model/admins/comment_model.dart';

class AdminCommentController {
  final AdminCommentDatasource _datasource;
  final String contact;

  AdminCommentController({
    required String contact,
    required String companyId,
    required String jobId,
  }) : _datasource = AdminCommentDatasource(
         contact: contact,
         companyId: companyId,
         jobId: jobId,
       ),
       contact = contact;

  //Ma`lumotlarni olish
  Future<List<CommentModel>> getComments() async {
    try {
      return await _datasource.getData();
    } catch (e) {
      print("Xatolik yuz berdi: $e");
      return [];
    }
  }

  // Yangi grade qo'shish
  Future<bool> addComment(CommentModel comment) async {
    try {
      await _datasource.setData(commentModel: comment);
      return true;
    } catch (e) {
      print("Qo'shishda xatolik: $e");
      return false;
    }
  }

  // Mavjud grade'ni tahrirlash
  Future<bool> updateComment(String id, CommentModel comment) async {
    try {
      await _datasource.editData(id: id, soz: comment);
      return true;
    } catch (e) {
      print("Tahrirlashda xatolik: $e");
      return false;
    }
  }

  // Grade'ni o'chirish
  Future<bool> deleteComment(String id) async {
    try {
      await _datasource.delete(id: id);
      return true;
    } catch (e) {
      print("O'chirishda xatolik: $e");
      return false;
    }
  }

  // Baholashni o'rnatish
  Future<bool> setComment(String coment) async {
    try {
      // Avval barcha ma'lumotlarni olamiz
      final comments = await _datasource.getData();

      // Joriy foydalanuvchi kontakti bo'yicha qidiramiz
      CommentModel? userComment;
      String? commentId;

      // Foydalanuvchining mavjud bahosini qidiramiz
      for (var comment in comments) {
        if (comment.contact == contact) {
          userComment = comment;
          // Firebase dan olingan ma'lumotlarda id qo'shilgani uchun dynamic cast qilib olamiz
          commentId = (coment as dynamic).id;
          break;
        }
      }

      // Yangi yoki yangilangan GradeModel
      final commentModel = CommentModel(contact: contact, coment: coment);

      if (userComment != null && commentId != null) {
        // Mavjud grade topildi - update qilamiz
        await _datasource.editData(id: commentId, soz: commentModel);
      } else {
        // Mavjud grade topilmadi - yangi yaratamiz
        await _datasource.setData(commentModel: commentModel);
      }

      return true;
    } catch (e) {
      print("Baholashni o'rnatishda xatolik: $e");
      return false;
    }
  }
}
