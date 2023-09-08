import 'package:cloudinary/cloudinary.dart';
import 'package:prlab_server/src/odm.dart';

import 'package:prlab_server/utils/config/constants.dart';

class OdmCloudinary extends ODM {
  final cloudinary = Cloudinary.signedConfig(
    apiKey: ConstantesPrLab.cloudinaryApiKey,
    apiSecret: ConstantesPrLab.cloudinaryApiSecret,
    cloudName: ConstantesPrLab.cloudinaryCloudName,
  );
}
