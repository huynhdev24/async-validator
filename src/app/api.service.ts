import { Injectable } from '@angular/core';
import { Observable, of } from 'rxjs';
import { delay } from 'rxjs/operators';

@Injectable()
export class ApiService {
  constructor() {}

  validateUsername(username: string): Observable<boolean> {
    console.log(`Trigger API call ${username}`);
    let existedUsers = ['user1', 'user2', 'user3'];
    let isValid = existedUsers.every((x) => x !== username);
    return of(isValid).pipe(delay(1000));
  }
}
