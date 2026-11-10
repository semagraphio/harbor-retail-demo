import { PrismaClient } from "@prisma/client";
const prisma = new PrismaClient();
export async function getOrders() {
    return prisma.$queryRaw`SELECT order_id, total_amount, ship_city FROM orders`;
}
