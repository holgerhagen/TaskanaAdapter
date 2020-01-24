package pro.taskana.adapter.camunda.util;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class ReadPropertiesHelper {

  private static final Logger LOGGER = LoggerFactory.getLogger(ReadPropertiesHelper.class);


  public static String getSchemaFromProperties(String propertiesFileName, String propertyName) {
    InputStream propertiesStream =
        ReadPropertiesHelper.class
            .getClassLoader()
            .getResourceAsStream(propertiesFileName);

    Properties properties = new Properties();
    String outboxSchema = null;

    try {

      properties.load(propertiesStream);
      outboxSchema = properties.getProperty(propertyName);


    } catch (IOException | NullPointerException e) {
      LOGGER.warn(
          "Caught {} while trying to retrieve the outbox-schema from the provided properties file",
          e);
    }

    return outboxSchema;
  }

}