#!/run/current-system/sw/bin/bash

# Path to your files
TEMPLATE_FILE="external/settings/template.nix"
VARIABLES_FILE="core/system/variables.nix"
MATTEO_SETTINGS_FILE="external/settings/matteo/matteo-settings.nix"
TIMO_SETTINGS_FILE="external/settings/timo/timo-settings.nix"
MATTEO_HW_FILE="external/settings/matteo/hardware-configuration.nix"
TIMO_HW_FILE="external/settings/timo/hardware-configuration.nix"
CORE_HW_FILE="core/hardware/hardware-configuration.nix"

# Initialize variables
SETTINGS_TO_USE=""
HW_FILE_TO_USE=""

# Function to display usage
usage() {
  echo "Usage: $0 --matteo | --timo"
  exit 1
}

# Parse arguments
while [[ $# -gt 0 ]]; do
  case "$1" in
    --matteo)
      SETTINGS_TO_USE=$MATTEO_SETTINGS_FILE
      HW_FILE_TO_USE=$MATTEO_HW_FILE
      shift
      ;;
    --timo)
      SETTINGS_TO_USE=$TIMO_SETTINGS_FILE
      HW_FILE_TO_USE=$TIMO_HW_FILE
      shift
      ;;
    *)
      echo "Error: Invalid argument: $1"
      usage
      ;;
  esac
done

# Ensure both parameters are provided
if [[ -z "$SETTINGS_TO_USE" ]]; then
  echo "Error: You must specify a configuration (--matteo or --timo)."
  usage
fi

# Backup the current variables file
if ! cp "$VARIABLES_FILE" "${VARIABLES_FILE}.bak"; then
  echo "Error: Failed to create a backup of $VARIABLES_FILE"
  exit 1
fi

# Backup the current hardware configuration file
if ! cp "$CORE_HW_FILE" "${CORE_HW_FILE}.bak"; then
  echo "Error: Failed to create a backup of $CORE_HW_FILE"
  exit 1
fi

# Copy the template file into variables.nix
if ! cp "$TEMPLATE_FILE" "$VARIABLES_FILE"; then
  echo "Error: Failed to copy $TEMPLATE_FILE to $VARIABLES_FILE"
  exit 1
fi

# Stage the change and commit with the provided message
git add "$VARIABLES_FILE"
if ! git commit --alow-empty -m "pushed template file"; then
  echo "Error: Failed to create a commit with the message: pushed template file"
  # Restore the backup in case of failure
  cp "${VARIABLES_FILE}.bak" "$VARIABLES_FILE"
  exit 1
fi

# Push the changes
if ! git push; then
  echo "Error: Failed to push the changes to the remote repository"
  # Restore the backup in case of failure
  cp "${VARIABLES_FILE}.bak" "$VARIABLES_FILE"
  exit 1
fi

# Restore the original hardware configuration
if ! cp "$HW_FILE_TO_USE" "$CORE_HW_FILE"; then
  echo "Error: Failed to restore the original hardware configuration from $HW_FILE_TO_USE"
  exit 1
fi

# Restore the original configuration
if ! cp "$SETTINGS_TO_USE" "$VARIABLES_FILE"; then
  echo "Error: Failed to restore the original configuration from $SETTINGS_TO_USE"
  exit 1
fi

# Check if there are changes to commit (if file was restored)
if [[ -n $(git status --porcelain) ]]; then
  git add "$VARIABLES_FILE"
  if ! git commit -m "Restore original configuration"; then
    echo "Error: Failed to commit the restoration of the original configuration"
    exit 1
  fi
fi

# Clean up the backup files
rm -f "${VARIABLES_FILE}.bak"
rm -f "${CORE_HW_FILE}.bak"

echo "Push completed successfully and configuration restored to $SETTINGS_TO_USE."
