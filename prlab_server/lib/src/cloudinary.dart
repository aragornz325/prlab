import 'package:cloudinary/cloudinary.dart';

import '../utils/config/constants.dart';

class CloudinaryOdm {
  final cloudinary = Cloudinary.signedConfig(
  apiKey: ConstantesPrLab.cloudinaryApiKey,
  apiSecret: ConstantesPrLab.cloudinaryApiSecret,
  cloudName: ConstantesPrLab.cloudinaryCloudName,
);
}

