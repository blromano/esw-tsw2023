-- CreateTable
CREATE TABLE `USUARIOS` (
    `USR_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `USR_NAME` VARCHAR(191) NOT NULL,
    `USR_SENHA` VARCHAR(191) NOT NULL,
    `USR_EMAIL` VARCHAR(191) NOT NULL,
    `USR_NOME_COMPLETO` VARCHAR(191) NOT NULL,
    `USR_STAFF` INTEGER NOT NULL,

    PRIMARY KEY (`USR_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Posts` (
    `POS_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `POS_MENSAGEM` VARCHAR(191) NOT NULL,
    `POS_URL_FOTO` VARCHAR(191) NOT NULL,
    `FK_USUARIOS_USR_ID` INTEGER NOT NULL,

    PRIMARY KEY (`POS_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tags` (
    `TAG_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `TAG_NOME` VARCHAR(191) NOT NULL,
    `FK_USUARIOS_USR_ID` INTEGER NOT NULL,

    PRIMARY KEY (`TAG_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Tickets` (
    `TIC_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `TIC_MENSAGEM` VARCHAR(191) NOT NULL,
    `FK_USUARIOS_USR_ID` INTEGER NOT NULL,

    PRIMARY KEY (`TIC_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TipoDenuncia` (
    `TIP_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `TIP_NOME` VARCHAR(191) NOT NULL,

    PRIMARY KEY (`TIP_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `Topicos` (
    `TOP_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `TOP_TITULO` VARCHAR(191) NOT NULL,
    `TOP_MENSAGEM` VARCHAR(191) NOT NULL,
    `FK_USUARIOS_USR_ID` INTEGER NOT NULL,

    PRIMARY KEY (`TOP_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TicketsTiposDenuncia` (
    `TTD_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `FK_TICKETS_TIC_ID` INTEGER NOT NULL,
    `FK_TIPO_DENUNCIA_TIP_ID` INTEGER NOT NULL,

    PRIMARY KEY (`TTD_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- CreateTable
CREATE TABLE `TopicosTags` (
    `TOT_ID` INTEGER NOT NULL AUTO_INCREMENT,
    `FK_TOPICOS_TOP_ID` INTEGER NOT NULL,
    `FK_TAGS_TAG_ID` INTEGER NOT NULL,

    PRIMARY KEY (`TOT_ID`)
) DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- AddForeignKey
ALTER TABLE `Posts` ADD CONSTRAINT `Posts_FK_USUARIOS_USR_ID_fkey` FOREIGN KEY (`FK_USUARIOS_USR_ID`) REFERENCES `USUARIOS`(`USR_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tags` ADD CONSTRAINT `Tags_FK_USUARIOS_USR_ID_fkey` FOREIGN KEY (`FK_USUARIOS_USR_ID`) REFERENCES `USUARIOS`(`USR_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Tickets` ADD CONSTRAINT `Tickets_FK_USUARIOS_USR_ID_fkey` FOREIGN KEY (`FK_USUARIOS_USR_ID`) REFERENCES `USUARIOS`(`USR_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `Topicos` ADD CONSTRAINT `Topicos_FK_USUARIOS_USR_ID_fkey` FOREIGN KEY (`FK_USUARIOS_USR_ID`) REFERENCES `USUARIOS`(`USR_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TicketsTiposDenuncia` ADD CONSTRAINT `TicketsTiposDenuncia_FK_TIPO_DENUNCIA_TIP_ID_fkey` FOREIGN KEY (`FK_TIPO_DENUNCIA_TIP_ID`) REFERENCES `TipoDenuncia`(`TIP_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TicketsTiposDenuncia` ADD CONSTRAINT `TicketsTiposDenuncia_FK_TICKETS_TIC_ID_fkey` FOREIGN KEY (`FK_TICKETS_TIC_ID`) REFERENCES `Tickets`(`TIC_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TopicosTags` ADD CONSTRAINT `TopicosTags_FK_TOPICOS_TOP_ID_fkey` FOREIGN KEY (`FK_TOPICOS_TOP_ID`) REFERENCES `Topicos`(`TOP_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE `TopicosTags` ADD CONSTRAINT `TopicosTags_FK_TAGS_TAG_ID_fkey` FOREIGN KEY (`FK_TAGS_TAG_ID`) REFERENCES `Tags`(`TAG_ID`) ON DELETE RESTRICT ON UPDATE CASCADE;
