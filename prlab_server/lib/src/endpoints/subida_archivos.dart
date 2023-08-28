import 'package:serverpod/server.dart';

class SubidaEndpoint extends Endpoint {
  Future<bool> getUploadDescription(Session session, String path) async {
    
    await session.storage.createDirectFileUploadDescription(
      storageId: 'public',
      path: path,
    );

    return true;
  }
}
