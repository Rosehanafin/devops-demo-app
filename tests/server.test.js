const request = require('supertest');
const app = require('../server');

describe('GET /api/info', () => {
  it('should return version 2.0.0', async () => {
    const response = await request(app).get('/api/info');
    expect(response.statusCode).toBe(200);
    expect(response.body.version).toBe('2.0.0');
  });
});
